<?php

namespace App\Http\Controllers;

use App\Models\Slider;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class SliderController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:slider create')->only(['create', 'store']);
        $this->middleware('can:slider read')->only(['index', 'show']);
        $this->middleware('can:slider update')->only(['edit', 'update']);
        $this->middleware('can:slider delete')->only(['destroy', 'massDelete']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = Slider::latest()->get();

        return view('sliders.index', compact('sliders'));
    }

    public function indexPublic()
    {
        $sliders = Slider::latest()->paginate(20);

        return view('sliders.public.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('sliders.create');
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
            'thumbnail' => ['required', 'file', 'image'],
            'position' => ['required'],
           ]);

        $file = $request->file('thumbnail');
        $path = Storage::disk('public')->putFile('sliders', new File($file));

        $slider = Slider::create([
            'title' => $request->title,
            'thumbnail' => $path,
            'position' => $request->position,
        ]);

        return redirect()->route('admin.sliders.index')->with('success', 'slider image uploaded !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect()->route('sliders.showPublic', $id);
        // $slider = Slider::findOrFail($id);

        // return view('sliders.show', compact('slider'));
    }

    public function showPublic($id)
    {
        $slider = Slider::findOrFail($id);

        return view('sliders.show', compact('slider'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $slider = Slider::findOrFail($id);

        return view('sliders.edit', compact('slider'));
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
            'thumbnail' => ['file', 'image'],
            'position' => ['required', 'string']
        ]);

        $slider = Slider::find($id);

        if ($request->hasFile('thumbnail')) {
            if (Storage::disk('public')->exists($slider->thumbnail)) {
                Storage::disk('public')->delete($slider->thumbnail);
            }
            $file = $request->file('thumbnail');
            $path = Storage::disk('public')->putFile('sliders', new File($file));
        }

        $slider->update([
            'title' => $request->title,
            'thumbnail' => $request->hasFile('thumbnail') ? $path : $slider->thumbnail,
            'position' => $request->position
        ]);

        return redirect()->route('admin.sliders.index')->with('success', 'slider image updated !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $slider = Slider::findOrFail($id);

        $body = $slider->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/sliders/images')) {
                    $imageName = explode('storage/sliders/images/', $data)[1];

                    Storage::delete('public/sliders/images/' . $imageName);
                }
            }
        }

        if (Storage::disk('public')->exists($slider->thumbnail)) {
            Storage::disk('public')->delete($slider->thumbnail);
        }

        $slider->delete();

        return redirect()->route('admin.sliders.index')->with('success', 'slider image deleted !');
    }

    public function massDelete(Request $request)
    {
        $arr = explode(',', $request->ids);

        foreach ($arr as $id) {
            $slider = Slider::findOrFail($id);

            $body = $slider->body;
            $dom = new DOMDocument();
            @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
            $images = $dom->getElementsByTagName('img');

            if ($images->count() >= 1) {
                foreach ($images as $image) {
                    $data = $image->getAttribute('src');

                    if (str_contains($data, 'storage/sliders/images')) {
                        $imageName = explode('storage/sliders/images/', $data)[1];

                        Storage::delete('public/sliders/images/' . $imageName);
                    }
                }
            }

            if (Storage::disk('public')->exists($slider->thumbnail)) {
                Storage::disk('public')->delete($slider->thumbnail);
            }

            $slider->delete();
        }

        return redirect()->route('admin.sliders.index')->with('success', 'Slider image deleted !');
    }
}
