@extends('layouts.public')

@section('head')
@endsection

@section('content')
    <div class="page-wrapper">
           
            <!--Portfolio Details Start-->
            <section class="portfolio-details">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="portfolio-details__img">
                                <img src="{{ Storage::disk('public')->url(@$event->thumbnail) }}" alt="">
                            </div>
                            <h3 class="portfolio-details__title text-center mt-4 pt-3">{{ $event->title }}</h3>
                        </div>
                    </div>
                    <div class="portfolio-details__content">
                        {!! $event->body !!}
                    </div>
                    
                </div>
            </section>
            <!--Portfolio Details End-->
    
        </div>
@endsection

@section('script')
@endsection
