<header class="main-header clearfix ">
    <div class="main-header__top">
        <div class="container">
            <div class="main-header__top-inner">
                <div class="main-header__top-address">
                    <ul class="list-unstyled main-header__top-address-list">
                        <li>
                            <i class="icon">
                                <span class="icon-pin"></span>
                            </i>
                            <div class="text">
                                <p>Gedung Prof. M. Sadli ( Gedung Magister Akuntansi ) 
                                         Lt. 1 Jl. Salemba No.4, RT.4/RW.6, Kenari </p>
                            </div>
                        </li>
                        <li>
                                <i class="icon">
                                    <span class="icon-email"></span>
                                </i>
                                <div class="text">
                                        <p><a href="mailto:KAKI.secretariat@gmail.com">KAKI.secretariat@gmail.com</a></p>
                                </div>
                            </li>
                        
                    </ul>
                </div>
                <div class="main-header__top-right">
                    <div class="main-header__top-menu-box">
                        <ul class="list-unstyled main-header__top-menu">
                              
                            <li><a href="{{ route('about') }}">About</a></li>
                        </ul>
                    </div>
                    <div class="main-header__top-social-box">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="main-menu clearfix">
        <div class="main-menu__wrapper clearfix">
            <div class="container">
                <div class="main-menu__wrapper-inner clearfix">
                    <div class="main-menu__logo">
                        <a href="{{ route('landingpage') }}"><img width="143" src="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}" alt=""></a>
                    </div>
                    <div class="main-menu__left">
                        <div class="main-menu__main-menu-box">
                            <div class="main-menu__main-menu-box-inner">
                                <a href="#" class="mobile-nav__toggler"><i class="fa fa-bars"></i></a>
                                <ul class="main-menu__list">
                                    <li>
                                        <a href="{{ route('landingpage') }}">Home </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Who We Are</a>
                                        <ul>
                                            <li><a href="{{ route('about') }}">About KAKI</a></li>
                                            <li><a href="{{ route('member') }}">Our Member</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Why KAKI</a>
                                        <ul>
                                            <li><a href="{{ route('why') }}">Why KAKI ?</a></li>
                                            <li><a href="{{ route('how') }}">How Does KAKI Work ?</a></li>
                                            <li><a href="{{ route('benefit') }}">KAKI Benefits</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#">Events</a>
                                        <ul>
                                            <li><a href="{{ route('seminar') }}">Seminar</a></li>
                                            <li><a href="{{ route('training') }}">Training</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="{{ route('media') }}">Media </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('contact') }}">Contact </a>
                                    </li>
                                    <li>
                                        <div id="google_translate_button"></div>
                                    </li>
                                    <li>
                                        
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="stricky-header stricked-menu main-menu">
        <div class="sticky-header__content">
                <nav class="main-menu clearfix">
                        <div class="main-menu__wrapper clearfix">
                            <div class="container">
                                <div class="main-menu__wrapper-inner clearfix">
                                    <div class="main-menu__logo">
                                        <a href="{{ route('landingpage') }}"><img width="143" src="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}" alt=""></a>
                                    </div>
                                    <div class="main-menu__left">
                                        <div class="main-menu__main-menu-box">
                                            <div class="main-menu__main-menu-box-inner">
                                                <a href="#" class="mobile-nav__toggler"><i class="fa fa-bars"></i></a>
                                                <ul class="main-menu__list">
                                                    <li>
                                                        <a href="{{ route('landingpage') }}">Home </a>
                                                    </li>
                                                    <li class="dropdown">
                                                        <a href="#">Who We Are</a>
                                                        <ul>
                                                            <li><a href="{{ route('about') }}">About KAKI</a></li>
                                                            <li><a href="{{ route('member') }}">Our Member</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="dropdown">
                                                        <a href="#">Why KAKI</a>
                                                        <ul>
                                                            <li><a href="news.html">Why KAKI ?</a></li>
                                                            <li><a href="news.html">How Does KAKI Work ?</a></li>
                                                            <li><a href="news.html">KAKI Benefits</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="dropdown">
                                                        <a href="#">Events</a>
                                                        <ul>
                                                            <li><a href="{{ route('seminar') }}">Seminar</a></li>
                                                            <li><a href="{{ route('training') }}">Training</a></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <a href="{{ route('media') }}">Media </a>
                                                    </li>
                                                    <li>
                                                        <a href="{{ route('contact') }}">Contact </a>
                                                    </li>
                                                    <li>
                                                        <div id="google_translate_button"></div>
                                                    </li>
                                                    <li></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>    
        </div><!-- /.sticky-header__content -->
    </div><!-- /.stricky-header -->