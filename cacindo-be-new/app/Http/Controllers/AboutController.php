<?php

namespace App\Http\Controllers;

use App\Models\About;
use Illuminate\Http\Request;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class AboutController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:about read')->only('index');
        $this->middleware('can:about update')->only(['update']);
    }

    public function index()
    {
        $about = About::first();
        if (!$about) {
            $about = About::create([
                'content' => null,
                'image' => null
            ]);
        }

        return view('about.index', compact('about'));
    }

    public function update(Request $request)
    {
        $about = About::first();

        // $about = Blog::find($id);

        $oldImages = [];
        $newImages = [];

        // start old images sorting
        $body = $about->content;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/about/images')) {
                    $imageName = explode('storage/about/images/', $data)[1];

                    array_push($oldImages, $imageName);
                }
            }
        }
        // end old images sorting

        // start new images sorting
        $body2 = $request->content;
        $dom2 = new DOMDocument();
        @$dom2->loadHTML($body2, LIBXML_HTML_NODEFDTD);
        $images2 = $dom2->getElementsByTagName('img');

        if ($images2->count() >= 1) {
            foreach ($images2 as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/about/images')) {
                    $imageName = explode('storage/about/images/', $data)[1];

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
        $body3 = $request->content;
        $dom3 = new DOMDocument();
        @$dom3->loadHTML($body3, LIBXML_HTML_NODEFDTD);
        $images3 = $dom3->getElementsByTagName('img');

        if ($images3->count() >= 1) {
            foreach ($images3 as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'base64')) {
                    @$extension = explode('/', mime_content_type($data))[1];
                    if (@$extension) {
                        $data = explode(';', $data);
                        $data = explode(',', $data[1]);
                        $data = $data[1];

                        $decoded = base64_decode($data);
                        $imageName = uniqid() . '.' . $extension;

                        Storage::put('public/about/images/' . $imageName, $decoded);

                        $image->setAttribute('src', asset('storage/about/images/' . $imageName));
                    }
                }
            }
        }

        $body3 = $dom3->saveHTML();
        // end upload new images

        // delete unused images
        foreach ($oldImages as $image) {
            Storage::delete('public/about/images/' . $image);
        }
        // end delete unused images

        // $slug = Str::of($request->title)->slug('-');

        if ($request->hasFile('image')) {
            $request->validate([
                'image' => ['file', 'image']
            ]);

            if (Storage::disk('public')->exists($about->image)) {
                Storage::disk('public')->delete($about->image);
            }
        }

        $file = $request->file('image');
        $path = Storage::disk('public')->putFile('about', new File($file));

        $about->update([
            'content' => $body3 ?? null,
            'image' => $path
        ]);

        return back()->with('success', 'About updated');
    }
}
