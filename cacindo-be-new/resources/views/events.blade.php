@extends('layouts.public')

@section('head')
@endsection

@section('content')
<section class="news-one">
    <div class="container">
        <div class="section-title text-center">
            <div class="section-sub-title-box">
                <p class="section-sub-title">recent INFO</p>
                <div class="section-title-shape-1">
                    <img src="{{ asset('cac-fe/assets/images/shapes/section-title-shape-1.png') }}" alt="">
                </div>
                <div class="section-title-shape-2">
                    <img src="{{ asset('cac-fe/assets/images/shapes/section-title-shape-2.png') }}" alt="">
                </div>
            </div>
            <h2 class="section-title__title"> {{ $title }}</h2>
        </div>
        <div class="row">
            <!--News One Single Start-->
            @foreach ($events as $event)
                
           
            <div class="col-xl-6 col-lg-6 col-sm-12 wow fadeInUp animated" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                <div class="news-one__single">
                    <div class="news-one__img">
                        <img src="{{ Storage::disk('public')->url(@$event->thumbnail)}}" alt="">
                        <div class="news-one__tag">
                            <p><i class="fa fa-newspaper"></i>{{ $title }}</p>
                        </div>
                        <div class="news-one__arrow-box">
                            <a href="{{ route('events.showPublic', $event->id) }}" class="news-one__arrow">
                                <span class="icon-right-arrow1"></span>
                            </a>
                        </div>
                    </div>
                    <div class="news-one__content">
                        <ul class="list-unstyled news-one__meta">
                            <li><a href="{{ route('events.showPublic', $event->id) }}"><i class="far fa-calendar"></i> {{ $event->created_at->diffForHumans() }} </a>
                            </li>
                        </ul>
                        <h3 class="news-one__title">
                            <a href="{{ route('events.showPublic', $event->id) }}">
                                {{ $event->title }}
                            </a>
                        </h3>
                        <p class="news-one__text">
                            {{ $event->short_description }}
                        </p>
                        <div class="news-one__read-more">
                            <a href="{{ route('events.showPublic', $event->id) }}">Read More <i class="fas fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            <!--News One Single End-->
        </div>
    </div>
</section>
@endsection

