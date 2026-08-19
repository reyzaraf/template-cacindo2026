<?php

namespace App\Http\Controllers;

use App\Models\Page;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PageController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:pages create')->only(['create', 'store']);
        $this->middleware('can:pages read')->only(['index', 'show']);
        $this->middleware('can:pages update')->only(['edit', 'update']);
        $this->middleware('can:pages delete')->only(['destroy', 'massDelete']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pages = Page::latest()->get();

        return view('pages.index', compact('pages'));
    }

    public function indexPublic()
    {
        $pages = Page::latest()->paginate(20);

        return view('pages.public.index', compact('pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.create');
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
            'slug' => ['required'],
            'content' => ['required'],
        ]);

        $content = $request->content;

        $dom = new DOMDocument();
        @$dom->loadHTML($content, LIBXML_HTML_NODEFDTD);

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

                    Storage::put('public/pages/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/pages/images/' . $imageName));
                }
            }
        }

        $content = $dom->saveHTML();


        $page = Page::create([
            'title' => $request->title,
            'content' => $content,
            'slug' => $request->slug,
        ]);

        // $slug = Str::of($request->title)->slug('-');

        // $page->update([
        //     'slug' => $slug
        // ]);

        return redirect()->route('admin.pages.index')->with('success', 'page uploaded !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect()->route('pages.showPublic', $id);
        // $page = Page::findOrFail($id);

        // return view('pages.show', compact('page'));
    }

    public function showPublic($id)
    {
        $page = Page::findOrFail($id);

        return view('pages.show', compact('page'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $page = Page::findOrFail($id);

        return view('pages.edit', compact('page'));
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
            'content' => ['required'],
            'slug' => ['required', 'string']
        ]);

        $page = Page::find($id);

        $oldImages = [];
        $newImages = [];

        // start old images sorting
        $content = $page->content;
        $dom = new DOMDocument();
        @$dom->loadHTML($content, LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/pages/images')) {
                    $imageName = explode('storage/pages/images/', $data)[1];

                    array_push($oldImages, $imageName);
                }
            }
        }
        // end old images sorting

        // start new images sorting
        $content2 = $request->content;
        $dom2 = new DOMDocument();
        @$dom2->loadHTML($content2, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        $images2 = $dom2->getElementsByTagName('img');

        if ($images2->count() >= 1) {
            foreach ($images2 as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/pages/images')) {
                    $imageName = explode('storage/pages/images/', $data)[1];

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
        $content3 = $request->content;
        $dom3 = new DOMDocument();
        @$dom3->loadHTML($content3, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
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

                    Storage::put('public/pages/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/pages/images/' . $imageName));
                }
            }
        }

        $content3 = $dom3->saveHTML();
        // end upload new images

        // delete unused images
        foreach ($oldImages as $image) {
            Storage::delete('public/pages/images/' . $image);
        }
        // end delete unused images

        // $slug = Str::of($request->title)->slug('-');

        if ($request->hasFile('thumbnail')) {
            if (Storage::disk('public')->exists($page->thumbnail)) {
                Storage::disk('public')->delete($page->thumbnail);
            }
            $file = $request->file('thumbnail');
            $path = Storage::disk('public')->putFile('pages', new File($file));
        }

        $page->update([
            'title' => $request->title,
            'content' => $content3,
            'slug' => $request->slug,
        ]);

        return redirect()->route('admin.pages.index')->with('success', 'page updated !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $page = Page::findOrFail($id);

        $content = $page->content;
        $dom = new DOMDocument();
        @$dom->loadHTML($content, LIBXML_HTML_NODEFDTD);
        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/pages/images')) {
                    $imageName = explode('storage/pages/images/', $data)[1];

                    Storage::delete('public/pages/images/' . $imageName);
                }
            }
        }

        if (Storage::disk('public')->exists($page->thumbnail)) {
            Storage::disk('public')->delete($page->thumbnail);
        }

        $page->delete();

        return redirect()->route('admin.pages.index')->with('success', 'page deleted !');
    }

    public function massDelete(Request $request)
    {
        $arr = explode(',', $request->ids);

        foreach ($arr as $id) {
            $page = Page::findOrFail($id);

            $content = $page->content;
            $dom = new DOMDocument();
            @$dom->loadHTML($content, LIBXML_HTML_NODEFDTD);
            $images = $dom->getElementsByTagName('img');

            if ($images->count() >= 1) {
                foreach ($images as $image) {
                    $data = $image->getAttribute('src');

                    if (str_contains($data, 'storage/pages/images')) {
                        $imageName = explode('storage/pages/images/', $data)[1];

                        Storage::delete('public/pages/images/' . $imageName);
                    }
                }
            }

            if (Storage::disk('public')->exists($page->thumbnail)) {
                Storage::disk('public')->delete($page->thumbnail);
            }

            $page->delete();
        }

        return redirect()->route('admin.pages.index')->with('success', 'Posts deleted !');
    }
}
