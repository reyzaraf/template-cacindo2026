<?php

namespace App\Http\Controllers;

use App\Models\Media;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class MediaController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:medias create')->only(['create', 'store']);
        $this->middleware('can:medias read')->only(['index', 'show']);
        $this->middleware('can:medias update')->only(['edit', 'update']);
        $this->middleware('can:medias delete')->only(['destroy', 'massDelete']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $medias = Media::latest()->get();

        return view('medias.index', compact('medias'));
    }

    public function indexPublic()
    {
        $medias = Media::latest()->paginate(20);

        return view('medias.public.index', compact('medias'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('medias.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => ['required', 'max:191'],
            'body' => ['required'],
            'thumbnail' => ['required', 'file', 'image'],
            'short_description' => ['required', 'string'],
            'category' => ['required', 'string'],
        ]);

        $body = $request->body;

        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'base64')) {
                    $extension = explode('/', mime_content_type($data))[1];
                    $data = explode(';', $data);
                    $data = explode(',', $data[1]);
                    // return $data;
                    $data = $data[1];

                    $decoded = base64_decode($data);
                    $imageName = uniqid() . '.' . $extension;

                    Storage::put('public/medias/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/medias/images/' . $imageName));
                }
            }
        }

        $body = $dom->saveHTML();

        $file = $request->file('thumbnail');
        $path = Storage::disk('public')->putFile('medias', new File($file));

        $media = Media::create([
            'title' => $request->title,
            'body' => $body,
            'slug' => 'slug',
            'thumbnail' => $path,
            'short_description' => $request->short_description,
            'category' => $request->category
        ]);

        $slug = Str::of($request->title)->slug('-');

        $media->update([
            'slug' => $slug
        ]);

        return redirect()->route('admin.medias.index')->with('success', 'media uploaded !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect()->route('medias.showPublic', $id);
        // $media = Media::findOrFail($id);

        // return view('medias.show', compact('media'));
    }

    public function showPublic($id)
    {
        $media = Media::findOrFail($id);

        return view('medias.show', compact('media'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $media = Media::findOrFail($id);

        return view('medias.edit', compact('media'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => ['required', 'max:191'],
            'body' => ['required'],
            'thumbnail' => ['file', 'image'],
            'short_description' => ['required', 'string']
        ]);

        $media = Media::find($id);

        $oldImages = [];
        $newImages = [];

        // start old images sorting
        $body = $media->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/medias/images')) {
                    $imageName = explode('storage/medias/images/', $data)[1];

                    array_push($oldImages, $imageName);
                }
            }
        }
        // end old images sorting

        // start new images sorting
        $body2 = $request->body;
        $dom2 = new DOMDocument();
        @$dom2->loadHTML($body2, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        $images2 = $dom2->getElementsByTagName('img');

        if ($images2->count() >= 1) {
            foreach ($images2 as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/medias/images')) {
                    $imageName = explode('storage/medias/images/', $data)[1];

                    array_push($newImages, $imageName);
                }
            }
        }
        // end new images sorting

        // start unset $oldImages if new images appear in old images
        foreach ($newImages as $image) {
            if (($key = array_search($image, $oldImages)) !== false) {
                unset($oldImages[$key]);
            }
        }
        // end unset $oldImages if new images appear in old images

        // start upload new images
        $body3 = $request->body;
        $dom3 = new DOMDocument();
        @$dom3->loadHTML($body3, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        $images3 = $dom3->getElementsByTagName('img');

        if ($images3->count() >= 1) {
            foreach ($images3 as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'base64')) {
                    $extension = explode('/', mime_content_type($data))[1];
                    $data = explode(';', $data);
                    $data = explode(',', $data[1]);
                    $data = $data[1];

                    $decoded = base64_decode($data);
                    $imageName = uniqid() . '.' . $extension;

                    Storage::put('public/medias/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/medias/images/' . $imageName));
                }
            }
        }

        $body3 = $dom3->saveHTML();
        // end upload new images

        // delete unused images
        foreach ($oldImages as $image) {
            Storage::delete('public/medias/images/' . $image);
        }
        // end delete unused images

        $slug = Str::of($request->title)->slug('-');

        if ($request->hasFile('thumbnail')) {
            if (Storage::disk('public')->exists($media->thumbnail)) {
                Storage::disk('public')->delete($media->thumbnail);
            }
            $file = $request->file('thumbnail');
            $path = Storage::disk('public')->putFile('medias', new File($file));
        }

        $media->update([
            'title' => $request->title,
            'body' => $body3,
            'slug' => $slug,
            'thumbnail' => $request->hasFile('thumbnail') ? $path : $media->thumbnail,
            'short_description' => $request->short_description
        ]);

        return redirect()->route('admin.medias.index')->with('success', 'media updated !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $media = Media::findOrFail($id);

        $body = $media->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/medias/images')) {
                    $imageName = explode('storage/medias/images/', $data)[1];

                    Storage::delete('public/medias/images/' . $imageName);
                }
            }
        }

        if (Storage::disk('public')->exists($media->thumbnail)) {
            Storage::disk('public')->delete($media->thumbnail);
        }

        $media->delete();

        return redirect()->route('admin.medias.index')->with('success', 'media deleted !');
    }

    public function massDelete(Request $request)
    {
        $arr = explode(',', $request->ids);

        foreach ($arr as $id) {
            $media = Media::findOrFail($id);

            $body = $media->body;
            $dom = new DOMDocument();
            @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
            $images = $dom->getElementsByTagName('img');

            if ($images->count() >= 1) {
                foreach ($images as $image) {
                    $data = $image->getAttribute('src');

                    if (str_contains($data, 'storage/medias/images')) {
                        $imageName = explode('storage/medias/images/', $data)[1];

                        Storage::delete('public/medias/images/' . $imageName);
                    }
                }
            }

            if (Storage::disk('public')->exists($media->thumbnail)) {
                Storage::disk('public')->delete($media->thumbnail);
            }

            $media->delete();
        }

        return redirect()->route('admin.medias.index')->with('success', 'Posts deleted !');
    }
}
