@extends('layouts.public')

@section('content')
      {{-- start content --}}
      <!--Main Slider Start-->
      <section class="main-slider clearfix">
            <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    @foreach ($sliders as $slider)
                      <div class="swiper-slide">
                          <img style="height: 600px; object-fit: cover;" src="{{ Storage::disk('public')->url(@$slider->thumbnail) }}" alt="">
                      </div>
                      @endforeach
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                  </div>
    </section>
    <!--Main Slider End-->
    <!-- section news -->
    <section>
        <div class="container pt-5">
            <div class="row">
                    <div class="col-lg-8 col-sm-12">
                            <h2 class="section-title__title mb-4">Seminar and Event</h2>
                            @foreach ($events->slice(0,4) as $event)
                            <div class="card mb-3" style="max-width: 1540px;">
                                    <div class="row no-gutters">
                                    <div class="col-md-4">
                                        <img src="{{ Storage::disk('public')->url(@$event->thumbnail) }}" style="height:100%;object-fit: cover;" class="card-img" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                <a href="{{ route('events.showPublic', $event->id) }}">
                                                    {{$event->title}}
                                                </a>
                                            </h5>
                                            <b class="card-text"><small class="text-muted"><i class="fas fa-calendar"></i>&nbsp; {{ $event->created_at->diffForHumans() }}</small></b>
                                            <p class="card-text">{{$event->short_description}}</p>
                                            <br>
                                            <div class="btn btn-dark mt-3 mb-3">
                                                    <a class="text-white" href="{{ route('events.showPublic', $event->id) }}">
                                                            Read More <i class="fas fa-angle-double-right"></i>
                                                    </a>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    </div>
                            </div>
                        @endforeach
                        
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <center>
                                <iframe width="350" height="720" src="https://www.youtube.com/embed/YY3pIMFfibM" title="Webinar: Understanding How To Prevent Corruption In New Reality" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    
                        </center>
                    </div>
            </div>
            
        
        </div>
    </section>
    <!-- end section news -->
    <!--News One Start-->
    <section class="news-one">
            <div class="container">
                <div class="section-title text-center">
                    <div class="section-sub-title-box">
                        <p class="section-sub-title">recent news feed</p>
                        <div class="section-title-shape-1">
                            <img src="assets/images/shapes/section-title-shape-1.png" alt="">
                        </div>
                        <div class="section-title-shape-2">
                            <img src="assets/images/shapes/section-title-shape-2.png" alt="">
                        </div>
                    </div>
                    <h2 class="section-title__title">Hightlights News</h2>
                </div>
                <div class="row">
                    <!--News One Single Start-->
                    @foreach($news->slice(0,4) as $newsletter)
                    <div class="col-xl-6 col-lg-6 col-sm-12 wow fadeInUp" data-wow-delay="100ms">
                        <div class="news-one__single">
                            <div class="news-one__img">
                                <img src="{{ Storage::disk('public')->url(@$newsletter->thumbnail) }}" alt="">
                                <div class="news-one__tag">
                                    <p><i class="far fa-newspaper"></i>hightlight</p>
                                </div>
                                <div class="news-one__arrow-box">
                                    <a href="{{ route('medias.showPublic', $newsletter->id) }}" class="news-one__arrow">
                                        <span class="icon-right-arrow1"></span>
                                    </a>
                                </div>
                            </div>
                            <div class="news-one__content">
                                <ul class="list-unstyled news-one__meta">
                                    <li><a href="#date"><i class="far fa-calendar"></i> {{ $newsletter->created_at->diffForHumans() }} </a>
                                    </li>
                                </ul>
                                <h3 class="news-one__title">
                                    <a href="{{ route('medias.showPublic', $newsletter->id) }}">
                                        {{ $newsletter->title}}
                                    </a>
                                </h3>
                                <p class="news-one__text">
                                    {{ $newsletter->short_description}}
                                </p>
                                <div class="news-one__read-more">
                                    <a href="{{ route('medias.showPublic', $newsletter->id) }}">Read More <i class="fas fa-angle-double-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    <!--News One Single End-->
                </div>
            </div>
        </section>
        <!--News One End-->
    <!-- section supporter -->
    <section class="supported pt-5 mt-3 mb-5 pb-3">
        <div class="container">
            <div class="section-title text-center">
                <h2 class="section-title__title">Supported By</h2>
            </div>
            <div class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                        @foreach($partners as $partner)
                      <div class="swiper-slide">
                          <img style="height:150px;width:auto;" src="{{ Storage::disk('public')->url(@$partner->thumbnail) }}" alt="{{$partner->title}}">
                      </div>
                      @endforeach
                    </div>
                    <!-- <div class="swiper-pagination"></div> -->
                  </div>
        </div>
    </section>
    <!-- end section supporter -->
    
    
    <!--Tracking Start-->
    <section class="tracking">
        <div class="container">
            <div class="tracking__inner">
                <div class="tracking-shape-1 float-bob-y">
                    <img src="{{ asset('cac-fe/assets/images/shapes/tracking-shape-1.png') }}" alt="">
                </div>
                <div class="tracking-shape-2 float-bob-x">
                    <img src="{{ asset('cac-fe/assets/images/shapes/tracking-shape-2.png') }}" alt="">
                </div>
                <div class="tracking-shape-3 float-bob-x">
                    <img src="{{ asset('cac-fe/assets/images/shapes/tracking-shape-3.png') }}" alt="">
                </div>
                <div class="tracking-shape-4 float-bob-y">
                    <img src="{{ asset('cac-fe/assets/images/shapes/tracking-shape-4.png') }}" alt="">
                </div>
                <div class="tracking__left">
                    <div class="tracking__icon">
                        <span class="icon-folder"></span>
                    </div>
                    <div class="tracking__content">
                        <p class="tracking__sub-title">Punya Pertanyaan ?</p>
                        <h3 class="tracking__title">Hubungi Kontak kami</h3>
                    </div>
                </div>
                <div class="tracking__btn-box">
                    <a href="{{ route('contact') }}" class="thm-btn tracking__btn">Kontak</a>
                </div>
            </div>
        </div>
    </section>
    <!--Tracking End-->
        <!-- end content wrapper -->

@endsection
