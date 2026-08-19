<!DOCTYPE html>
<html lang="en">

<head>
    <title>CAC Indonesia - Koalisi Anti Korupsi Indonesia</title>

    <meta charset="utf-8" />
    <!--[if IE
      ]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"
    /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />

    <!-- Google Fonts -->
    <link href="{{ asset('ssi-fe/css?family=Roboto:400,400i,500,700') }}" rel="stylesheet" />

    <!-- Css -->
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}">
    <link rel="manifest" href="assets/images/favicons/site.webmanifest">
    <meta name="description" content="CAC-INDONESIA / Koalisi Anti Korupsi Indonesia ">

    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">

    <link href="../../css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/animate/animate.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/animate/custom-animate.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/fontawesome/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/jarallax/jarallax.css">') }}
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/jquery-magnific-popup/jquery.magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/nouislider/nouislider.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/nouislider/nouislider.pips.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/odometer/odometer.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/swiper/swiper.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/insur-icons/style.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/insur-two-icon/style.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/tiny-slider/tiny-slider.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/reey-font/stylesheet.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/owl-carousel/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/owl-carousel/owl.theme.default.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/bxslider/jquery.bxslider.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/bootstrap-select/css/bootstrap-select.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/vegas/vegas.min.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/jquery-ui/jquery-ui.css') }}">
    {{-- <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/timepicker/timePicker.css">') }} --}}
    {{-- <link rel="stylesheet" href="{{ asset('cac-fe/assets/vendors/ion.rangeSlider/css/ion.rangeSlider.min.css') }}"> --}}
    


    <!-- template styles -->
    <link rel="stylesheet" id="langLtr" href="{{ asset('cac-fe/assets/css/insur.css') }}">
    <link rel="stylesheet" href="{{ asset('cac-fe/assets/css/insur-responsive.css') }}">

    <!-- Favicons -->
    <link rel="shortcut icon" href="{{ asset('cac-fe/assets/images/resources/logo-1.png') }}" />

    @yield('head')
</head>

<body class="custom-cursor">
    <!-- Preloader -->
    {{-- <div class="preloader">
        <div class="preloader__image"></div>
    </div>  --}}
    <!-- /.preloader -->
    <div class="page-wrapper">
  
    <main class="main-wrapper">
        <!-- Navigation -->
        <x-public.navbar2 />
        <!-- end navigation -->

        @yield('content')
        
    </main>
    @include('layouts.footer')
    </div>
    <!-- end main wrapper -->

    <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>
    
    
    <!-- jQuery Scripts -->
    <script src="{{ asset('cac-fe/assets/vendors/jquery/jquery-3.6.0.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/bootstrap/js/bootstrap.bundle.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jarallax/jarallax.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-appear/jquery.appear.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-circle-progress/jquery.circle-progress.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-validate/jquery.validate.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/nouislider/nouislider.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/odometer/odometer.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/swiper/swiper.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/tiny-slider/tiny-slider.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/wnumb/wNumb.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/wow/wow.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/isotope/isotope.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/countdown/countdown.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/owl-carousel/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('cac-fe/assets/vendors/bxslider/jquery.bxslider.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/bootstrap-select/js/bootstrap-select.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/vegas/vegas.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/jquery-ui/jquery-ui.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/circleType/jquery.circleType.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/circleType/jquery.lettering.min.js') }} "></script>
    <script src="{{ asset('cac-fe/assets/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js') }} "></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script> -->
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script src="{{ asset('cac-fe/assets/js/insur.js') }}"></script>
    @yield('script')
    <!-- template js -->
    <script>

        var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    var swiper2 = new Swiper(".mySwiper2", {
    slidesPerView: 3,
    spaceBetween: 50,
    freeMode: true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      }
    //   navigation: {
    //     nextEl: ".swiper-button-next",
    //     prevEl: ".swiper-button-prev",
    //   },
    });
    // function googleTranslateInit() {
    //   new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_button');
    // };
    function googleTranslateElementInit(){
      new google.translate.TranslateElement({pageLanguage:'id',includedLanguages:'en,id'},'google_translate_button');
    }
    function OnePageMenuScroll() {
    var windscroll = $(window).scrollTop();
    if (windscroll >= 117) {
      var menuAnchor = $(".one-page-scroll-menu .scrollToLink").children("a");
      menuAnchor.each(function () {
        var sections = $(this).attr("href");
        $(sections).each(function () {
          if ($(this).offset().top <= windscroll + 100) {
            var Sectionid = $(sections).attr("id");
            $(".one-page-scroll-menu").find("li").removeClass("current");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current-menu-ancestor");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current_page_item");
            $(".one-page-scroll-menu")
              .find("li")
              .removeClass("current-menu-parent");
            $(".one-page-scroll-menu")
              .find("a[href*=\\#" + Sectionid + "]")
              .parent()
              .addClass("current");
          }
        });
      });
    } else {
      $(".one-page-scroll-menu li.current").removeClass("current");
      $(".one-page-scroll-menu li:first").addClass("current");
    }
  }

  $(window).on("scroll", function () {
    if ($(".stricked-menu").length) {
      var headerScrollPos = 130;
      var stricky = $(".stricked-menu");
      if ($(window).scrollTop() > headerScrollPos) {
        stricky.addClass("stricky-fixed");
      } else if ($(this).scrollTop() <= headerScrollPos) {
        stricky.removeClass("stricky-fixed");
      }
    }
    if ($(".scroll-to-top").length) {
      var strickyScrollPos = 100;
      if ($(window).scrollTop() > strickyScrollPos) {
        $(".scroll-to-top").fadeIn(500);
      } else if ($(this).scrollTop() <= strickyScrollPos) {
        $(".scroll-to-top").fadeOut(500);
      }
    }
  });
    
    </script>
</body>

</html>
