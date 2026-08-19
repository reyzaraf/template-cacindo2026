@extends('layouts.public')

@section('content')
<section class="services-one">
        <div class="services-one__top">
            <div class="container">
                    <div class="section-title text-center">
                            <div class="section-sub-title-box">
                                <p class="section-sub-title">Pilih Kategori MEDIA</p>
                                <div class="section-title-shape-1">
                                    <img src="assets/images/shapes/section-title-shape-1.png" alt="">
                                </div>
                                <div class="section-title-shape-2">
                                    <img src="assets/images/shapes/section-title-shape-2.png" alt="">
                                </div>
                            </div>
                            <h2 class="section-title__title"> Koalisi Anti Korupsi Indonesia</h2>
                        </div>
            </div>
        </div>
        <div class="services-one__bottom">
            <div class="services-one__container">
                <div class="row">
                    <!--Services One Single Start-->
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 wow fadeInUp animated" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <div class="services-one__single">
                            <div class="service-one__img">
                                <img src="{{ asset('cac-fe/assets/images/media/4.jpg') }}" alt="">
                            </div>
                            <div class="service-one__content">
                                <div class="services-one__icon">
                                        <a href="{{ route('news') }}">
                                                <i class="fa fa-newspaper"></i>
                                            </a>
                                </div>
                                <h2 class="service-one__title"><a href="{{ route('news') }}">News</a></h2>
                                <p class="service-one__text">Semua Berita dari KAKI</p>
                            </div>
                        </div>
                    </div>
                    <!--Services One Single End-->
                    <!--Services One Single Start-->
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 wow fadeInUp animated" data-wow-delay="200ms" style="visibility: visible; animation-delay: 200ms; animation-name: fadeInUp;">
                        <div class="services-one__single">
                            <div class="service-one__img">
                                <img src="{{ asset('cac-fe/assets/images/media/4.jpg') }}" alt="">
                            </div>
                            <div class="service-one__content">
                                <div class="services-one__icon">
                                        <a href="{{ route('inthenews') }}">
                                            <i class="fa fa-newspaper"></i>
                                        </a>
                                </div>
                                <h2 class="service-one__title"><a href="{{ route('inthenews') }}">In The News</a></h2>
                                <p class="service-one__text">Semua berita tentang KAKI</p>
                            </div>
                        </div>
                    </div>
                    <!--Services One Single End-->
                    <!--Services One Single Start-->
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 wow fadeInUp animated" data-wow-delay="300ms" style="visibility: visible; animation-delay: 300ms; animation-name: fadeInUp;">
                        <div class="services-one__single">
                            <div class="service-one__img">
                                <img src="{{ asset('cac-fe/assets/images/media/6.jpg') }}" alt="">
                            </div>
                            <div class="service-one__content">
                                    <div class="services-one__icon">
                                    <a href="{{ route('podcast') }}">
                                        <i class="fa fa-podcast"></i>
                                    </a>
                                    </div>
                                <h2 class="service-one__title"><a href="{{ route('podcast') }}">Podcast</a></h2>
                                <p class="service-one__text">Semua Podcast dari KAKI</p>
                            </div>
                        </div>
                    </div>
                    <!--Services One Single End-->
                    <!--Services One Single Start-->
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 wow fadeInUp animated" data-wow-delay="400ms" style="visibility: visible; animation-delay: 400ms; animation-name: fadeInUp;">
                        <div class="services-one__single">
                            <div class="service-one__img">
                                <img src="{{ asset('cac-fe/assets/images/media/3.jpg') }}" alt="">
                            </div>
                            <div class="service-one__content">
                                <div class="services-one__icon">
                                    <a href="{{ route('video') }}">
                                        <i class="fa fa-video"></i>
                                    </a>
                                </div>
                                <h2 class="service-one__title"><a href="{{ route('video') }}">Video</a>
                                </h2>
                                <p class="service-one__text">Semua Video dari KAKI</p>
                            </div>
                        </div>
                    </div>
                    <!--Services One Single End-->
                    <!--Services One Single Start-->
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 wow fadeInUp animated" data-wow-delay="500ms" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInUp;">
                        <div class="services-one__single">
                            <div class="service-one__img">
                                <img src="{{ asset('cac-fe/assets/images/media/3.jpg') }}" alt="">
                            </div>
                            <div class="service-one__content">
                                <div class="services-one__icon">
                                    <a href="{{ route('image') }}">
                                        <i class="fa fa-image"></i>
                                    </a>
                                </div>
                                <h2 class="service-one__title"><a href="{{ route('image') }}">Gambar
                                        </a></h2>
                                <p class="service-one__text">Semua Gambar dari KAKI</p>
                            </div>
                        </div>
                    </div>
                    <!--Services One Single End-->
                </div>
            </div>
        </div>  
    </section>

@endsection
