<header class="nav">
    <div class="nav__holder nav--sticky">
        <div class="container-fluid container-semi-fluid nav__container">
            <div class="flex-parent">
                <div class="nav__header">
                    <!-- Logo -->
                    <a href="{{ route('landingpage') }}" class="logo-container flex-child">
                        <img class="logo" src="{{ asset('ssi-fe/src/img/ssi/Layer 2.png') }}" alt="logo" />
                    </a>

                    <!-- Mobile toggle -->
                    <button type="button" class="nav__icon-toggle" id="nav__icon-toggle" data-toggle="collapse"
                        data-target="#navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="nav__icon-toggle-bar"></span>
                        <span class="nav__icon-toggle-bar"></span>
                        <span class="nav__icon-toggle-bar"></span>
                    </button>
                </div>

                <!-- Navbar -->
                <nav id="navbar-collapse" class="nav__wrap collapse navbar-collapse">
                    <ul class="nav__menu">
                        <li class="{{ request()->routeIs('landingpage') ? 'active' : '' }}">
                            <a href="{{ route('landingpage') }}">@lang('navigation.member')</a>
                        </li>
                        {{-- <li class="nav__dropdown {{ request()->routeIs('services.show') ? 'active' : '' }}">
                            <a href="#">Consultation</a>
                            <i class="ui-arrow-down nav__dropdown-trigger"></i>
                            <ul class="nav__dropdown-menu">
                                <x-navbar.services />
                            </ul>
                        </li> --}}
                        {{-- <li class="{{ request()->routeIs('trainings.show') ? 'active' : '' }}">
                            <a href="{{ route('trainings.show') }}">Trainings</a>
                        </li>
                        <li class="{{ request()->routeIs('check.certificate') ? 'active' : '' }}">
                            <a href="{{ route('check.certificate') }}">Certificate Check</a>
                        </li>--}}
                        <li> 
                                
                            <a href="#section-contact-us">Contact Us</a>
                        </li>
                        <li>
                              
                                          <a class="dropdown-item" href="{{ url('locale/id') }}">Indonesia</a>
                                          <a class="dropdown-item" href="{{ url('locale/en') }}">English</a>
                        </li>
                    </ul>
                    <!-- end menu -->
                </nav>
                <!-- end nav-wrap -->

                <div class="nav__btn-holder nav--align-right">
                    <a href="#" class="align-items-center align-items-lg-start btn d-flex flex-column nav__btn"
                        id="callUsNav">
                        <span class="nav__btn-text" style="font-size: 15px">Call Us Now</span>
                        <span class="nav__btn-phone" style="font-size: 15px">+6221 82769272</span>
                    </a>
                </div>
            </div>
            <!-- end flex-parent -->
        </div>
        <!-- end container -->
    </div>
</header>
