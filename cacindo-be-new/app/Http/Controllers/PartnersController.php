<?php

namespace App\Http\Controllers;

use App\Models\Partners;
use DOMDocument;
use Illuminate\Http\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PartnersController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:partner create')->only(['create', 'store']);
        $this->middleware('can:partner read')->only(['index', 'show']);
        $this->middleware('can:partner update')->only(['edit', 'update']);
        $this->middleware('can:partner delete')->only(['destroy', 'massDelete']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $partners = Partners::latest()->get();

        return view('partners.index', compact('partners'));
    }

    public function indexPublic()
    {
        $partners = Partners::latest()->paginate(20);

        return view('partners.public.index', compact('partners'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('partners.create');
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
        $path = Storage::disk('public')->putFile('partners', new File($file));

        $partner = Partners::create([
            'title' => $request->title,
            'thumbnail' => $path,
            'position' => $request->position,
        ]);

        return redirect()->route('admin.partners.index')->with('success', 'partner logo uploaded !');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect()->route('partners.showPublic', $id);
        // $partner = Partners::findOrFail($id);

        // return view('partners.show', compact('partner'));
    }

    public function showPublic($id)
    {
        $partner = Partners::findOrFail($id);

        return view('partners.show', compact('partner'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $partner = Partners::findOrFail($id);

        return view('partners.edit', compact('partner'));
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

        $partner = Partners::find($id);

        if ($request->hasFile('thumbnail')) {
            if (Storage::disk('public')->exists($partner->thumbnail)) {
                Storage::disk('public')->delete($partner->thumbnail);
            }
            $file = $request->file('thumbnail');
            $path = Storage::disk('public')->putFile('partners', new File($file));
        }

        $partner->update([
            'title' => $request->title,
            'thumbnail' => $request->hasFile('thumbnail') ? $path : $partner->thumbnail,
            'position' => $request->position
        ]);

        return redirect()->route('admin.partners.index')->with('success', 'partner logo updated !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $partner = Partners::findOrFail($id);

        $body = $partner->body;
        $dom = new DOMDocument();
        @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
        $images = $dom->getElementsByTagName('img');

        if ($images->count() >= 1) {
            foreach ($images as $image) {
                $data = $image->getAttribute('src');

                if (str_contains($data, 'storage/partners/images')) {
                    $imageName = explode('storage/partners/images/', $data)[1];

                    Storage::delete('public/partners/images/' . $imageName);
                }
            }
        }

        if (Storage::disk('public')->exists($partner->thumbnail)) {
            Storage::disk('public')->delete($partner->thumbnail);
        }

        $partner->delete();

        return redirect()->route('admin.partners.index')->with('success', 'partner logo deleted !');
    }

    public function massDelete(Request $request)
    {
        $arr = explode(',', $request->ids);

        foreach ($arr as $id) {
            $partner = Partners::findOrFail($id);

            $body = $partner->body;
            $dom = new DOMDocument();
            @$dom->loadHTML($body, LIBXML_HTML_NODEFDTD);
            $images = $dom->getElementsByTagName('img');

            if ($images->count() >= 1) {
                foreach ($images as $image) {
                    $data = $image->getAttribute('src');

                    if (str_contains($data, 'storage/partners/images')) {
                        $imageName = explode('storage/partners/images/', $data)[1];

                        Storage::delete('public/partners/images/' . $imageName);
                    }
                }
            }

            if (Storage::disk('public')->exists($partner->thumbnail)) {
                Storage::disk('public')->delete($partner->thumbnail);
            }

            $partner->delete();
        }

        return redirect()->route('admin.partners.index')->with('success', 'partner logo deleted !');
    }
}
