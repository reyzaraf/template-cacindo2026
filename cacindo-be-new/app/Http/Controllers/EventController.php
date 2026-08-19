<?php

namespace App\Http\Controllers;

use App\Models\Event;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class EventController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:events create')->only(['create', 'store']);
        $this->middleware('can:events read')->only(['index', 'show']);
        $this->middleware('can:events update')->only(['edit', 'update']);
        $this->middleware('can:events delete')->only(['destroy', 'massDelete']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $events = Event::latest()->get();

        return view('events.index', compact('events'));
    }

    public function indexPublic()
    {
        $events = Event::latest()->paginate(20);

        return view('events.public.index', compact('events'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('events.create');
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
            'short_description' => ['required', 'string'],
            'thumbnail' => ['required', 'file', 'image'],
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

                    Storage::put('public/events/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/events/images/' . $imageName));
                }
            }
        }

        $body = $dom->saveHTML();

        $file = $request->file('thumbnail');
        $path = Storage::disk('public')->putFile('events', new File($file));

        $event = Event::create([
            'title' => $request->title,
            'body' => $body,
            'slug' => 'slug',
            'thumbnail' => $path,
            'short_description' => $request->short_description,
            'category' => $request->category
        ]);

        $slug = Str::of($request->title)->slug('-');

        $event->update([
            'slug' => $slug
        ]);

        return redirect()->route('admin.events.index')->with('success', 'Event uploaded !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect()->route('events.showPublic', $id);
        // $event = Event::findOrFail($id);

        // return view('events.show', compact('event'));
    }

    public function showPublic($id)
    {
        $event = Event::findOrFail($id);

        return view('events.show', compact('event'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $event = Event::findOrFail($id);

        return view('events.edit', compact('event'));
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
            'short_description' => ['required', 'string'],
            'category' => ['required', 'string']
        ]);

        $event = Event::find($id);

        $oldImages = [];
        $newImages = [];

        // start old images sorting
        $body = $event->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/events/images')) {
                    $imageName = explode('storage/events/images/', $data)[1];

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

                if (str_contains($data, 'storage/events/images')) {
                    $imageName = explode('storage/events/images/', $data)[1];

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

                    Storage::put('public/events/images/' . $imageName, $decoded);

                    $image->setAttribute('src', asset('storage/events/images/' . $imageName));
                }
            }
        }

        $body3 = $dom3->saveHTML();
        // end upload new images

        // delete unused images
        foreach ($oldImages as $image) {
            Storage::delete('public/events/images/' . $image);
        }
        // end delete unused images

        $slug = Str::of($request->title)->slug('-');

        if ($request->hasFile('thumbnail')) {
            if (Storage::disk('public')->exists($event->thumbnail)) {
                Storage::disk('public')->delete($event->thumbnail);
            }
            $file = $request->file('thumbnail');
            $path = Storage::disk('public')->putFile('events', new File($file));
        }

        $event->update([
            'title' => $request->title,
            'body' => $body3,
            'slug' => $slug,
            'thumbnail' => $request->hasFile('thumbnail') ? $path : $event->thumbnail,
            'short_description' => $request->short_description,
            'category' => $request->category
        ]);

        return redirect()->route('admin.events.index')->with('success', 'Event updated !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $event = Event::findOrFail($id);

        $body = $event->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/events/images')) {
                    $imageName = explode('storage/events/images/', $data)[1];

                    Storage::delete('public/events/images/' . $imageName);
                }
            }
        }

        if (Storage::disk('public')->exists($event->thumbnail)) {
            Storage::disk('public')->delete($event->thumbnail);
        }

        $event->delete();

        return redirect()->route('admin.events.index')->with('success', 'Event deleted !');
    }

    public function massDelete(Request $request)
    {
        $arr = explode(',', $request->ids);

        foreach ($arr as $id) {
            $event = Event::findOrFail($id);

            $body = $event->body;
            $dom = new DOMDocument();
            @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
            $images = $dom->getElementsByTagName('img');

            if ($images->count() >= 1) {
                foreach ($images as $image) {
                    $data = $image->getAttribute('src');

                    if (str_contains($data, 'storage/events/images')) {
                        $imageName = explode('storage/events/images/', $data)[1];

                        Storage::delete('public/events/images/' . $imageName);
                    }
                }
            }

            if (Storage::disk('public')->exists($event->thumbnail)) {
                Storage::disk('public')->delete($event->thumbnail);
            }

            $event->delete();
        }

        return redirect()->route('admin.events.index')->with('success', 'Posts deleted !');
    }
}
