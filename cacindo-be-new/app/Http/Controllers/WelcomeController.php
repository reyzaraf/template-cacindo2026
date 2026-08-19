<?php

namespace App\Http\Controllers;
use App\Models\Slider;
use App\Models\Home;
use App\Models\Partners;
use App\Models\Page;
use App\Models\Footer;
use App\Models\News;
use App\Models\Media;

use App\Models\Resource;
use App\Models\Event;
use App\Models\Schedule;
use App\Models\ScheduleRegist;

use Illuminate\Http\Request;

class WelcomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $sliders = Slider::orderBy('position')->get();
        $medias = Media::latest()->get();
        $news = Media::latest()->where('category','news')->get();
        $events = Event::latest()->get();
        $partners = Partners::orderBy('position',)->get();
        // return view('welcome',compact('sliders','medias','resources','events','partners'));
        return view('landingpage',compact('sliders','medias','news','events','partners'));
    }


    public function showpage($slug)
    {
        $profiles = "profile"; 
        $pages = Page::where('category',$profiles)->get();
        $sliders = Slider::latest()->get();
        $homes = Home::all();
        $partners = Partner::all();
        $founders = Founder::all();
        $footers = Footer::all();
        $page = Page::where('slug',$slug)->first();
        return view('partials.profile',compact('pages','sliders','homes','partners','founders','footers'))->with('page', $page);
    }


    public function showabout()
    {

        $slug = "about";
        $page = Page::where('slug',$slug)->first();
        return view('paging')->with('page', $page);
    }
    public function showmember()
    {
        $slug = "member";
        $page = Page::where('slug',$slug)->first();
        return view('paging')->with('page', $page);
    }
    public function showwhy()
    {
        $slug = "why";
        $page = Page::where('slug',$slug)->first();
        return view('paging')->with('page', $page);
    }
    public function showbenefit()
    {
        $slug = "benefit-kaki";
        $page = Page::where('slug',$slug)->first();
        return view('paging')->with('page', $page);
    }
    public function showhow()
    {
        $slug = "how-kaki-works";
        $page = Page::where('slug',$slug)->first();
        return view('paging')->with('page', $page);
    }
    public function showmedia()
    {
        return view('media');
    }
    public function showcontact()
    {

        $slug = "contact";
        $page = Page::where('slug',$slug)->first();

        return view('paging')->with('page', $page);
    }
    public function showtraining()
    {
        $title = "Training";
        $events = Event::where('category','training')->latest()->get();
        return view('events',compact('events','title'));
    }

    public function showseminar()
    {
        $title = "Seminar";
        $events = Event::where('category','seminar')->latest()->get();
        return view('events',compact('events','title'));
    }

    public function showpodcast()
    {
       $title = "Podcast"; 
       $medias = Media::where('category','podcast')->latest()->get();
       return view('medias',compact('medias','title'));
    }

    public function shownews()
    {
        $title = "News";
        $medias = Media::where('category','news')->latest()->get();
        return view('medias',compact('medias','title'));
    }
    public function showinthenews()
    {
        $title = "In The News";
        $medias = Media::where('category','in the news')->latest()->get();
        return view('medias',compact('medias','title'));
    }

    public function showimage()
    {
        $title = "Photos";
        $medias = Media::where('category','image')->latest()->get();
        return view('medias',compact('medias','title'));
    }
    public function showvideo()
    {
        $title="Videos";
        $medias = Media::where('category','video')->latest()->get();
        return view('medias',compact('medias','title'));
    }


  
    public function showdetailevent(Event $event)
    {
       $pages = Page::all();
    //    $news = News::all();
       $partners = Partner::all();
       $founders = Founder::all();
       $footers = Footer::all();
       return view('partials.detailevent',compact('event','partners','founders','footers'))->with('pages',$pages);
    }

    public function showevent()
    {
       $trainings = Event::where('category','training')->latest()->get();
       $partners = Partner::all();
       $founders = Founder::all();
       $footers = Footer::all();
       return view('partials.event3',compact('awards','partners','founders','footers','trainings'));
    }

}
