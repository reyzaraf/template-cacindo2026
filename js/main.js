/* ==========================================================================
   CAC INDONESIA / KAKI — main.js
   Vanilla JS, tanpa dependensi (pengganti Swiper + jQuery pada template lama).

   Modul:
     0  Preloader
     1  Sticky menu utama
     2  Drawer navigasi mobile (+ focus trap)
     3  Dropdown menu (desktop hover / klik, mobile accordion)
     4  Main slider  — pengganti Swiper .mySwiper
     5  Marquee mitra — pengganti Swiper .mySwiper2
     6  Reveal on scroll (Intersection Observer)
     7  Penanda menu aktif
     8  Tombol kembali ke atas
     9  Tahun otomatis di footer
    10  Self-assessment (halaman Integrity Assessment)
   ========================================================================== */
(function () {
  'use strict';

  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var DESKTOP = window.matchMedia('(min-width: 992px)');

  function onMediaChange(mq, fn) {
    if (mq.addEventListener) mq.addEventListener('change', fn);
    else if (mq.addListener) mq.addListener(fn);
  }

  /* ========================================================================
     0. PRELOADER — disembunyikan setelah semua aset selesai dimuat
        Ada tiga pengaman supaya halaman tidak pernah tertahan:
          · minimum tampil 400 ms  → tidak berkedip saat halaman sudah di-cache
          · batas aman 5 detik     → koneksi lambat tetap bisa membaca konten
          · failsafe inline 6 detik di layout → jaga-jaga bila berkas ini gagal dimuat
     ======================================================================== */
  (function preloader() {
    var el = document.querySelector('[data-preloader]');
    if (!el) return;

    var MIN_VISIBLE = 400;
    var SAFETY = 5000;
    var start = Date.now();
    var done = false;

    function hide() {
      if (done) return;
      done = true;
      el.classList.add('is-done');
      window.setTimeout(function () {
        if (el.parentNode) el.parentNode.removeChild(el);
      }, 500);
    }

    function finish() {
      var wait = reduceMotion ? 0 : Math.max(0, MIN_VISIBLE - (Date.now() - start));
      window.setTimeout(hide, wait);
    }

    if (document.readyState === 'complete') finish();
    else window.addEventListener('load', finish);

    window.setTimeout(hide, SAFETY);
  })();

  /* ========================================================================
     1. STICKY MENU — menu utama menempel saat halaman digulir
     ======================================================================== */
  (function stickyMenu() {
    var menu = document.querySelector('[data-main-menu]');
    if (!menu) return;

    var placeholder = document.createElement('div');
    var ticking = false;
    var stuck = false;

    function update() {
      ticking = false;
      var trigger = menu.parentNode === placeholder.parentNode
        ? placeholder.offsetTop
        : menu.offsetTop;

      if (!stuck && window.scrollY > trigger + 40) {
        placeholder.style.height = menu.offsetHeight + 'px';
        menu.parentNode.insertBefore(placeholder, menu);
        menu.classList.add('is-sticky');
        stuck = true;
      } else if (stuck && window.scrollY <= placeholder.offsetTop) {
        menu.classList.remove('is-sticky');
        if (placeholder.parentNode) placeholder.parentNode.removeChild(placeholder);
        stuck = false;
      }
    }

    window.addEventListener('scroll', function () {
      if (!ticking) { window.requestAnimationFrame(update); ticking = true; }
    }, { passive: true });
    window.addEventListener('resize', function () {
      if (stuck) placeholder.style.height = menu.offsetHeight + 'px';
    }, { passive: true });

    update();
  })();

  /* ========================================================================
     2. DRAWER NAVIGASI MOBILE
     ======================================================================== */
  (function mobileNav() {
    var nav = document.querySelector('[data-mobile-nav]');
    var openBtn = document.querySelector('[data-nav-open]');
    var closeBtn = document.querySelector('[data-nav-close]');
    var overlay = document.querySelector('[data-nav-overlay]');
    if (!nav || !openBtn || !overlay) return;

    var lastFocused = null;

    function openNav() {
      lastFocused = document.activeElement;
      nav.classList.add('is-open');
      overlay.hidden = false;
      void overlay.offsetWidth;              // paksa reflow agar transisi jalan
      overlay.classList.add('is-visible');
      openBtn.setAttribute('aria-expanded', 'true');
      document.body.classList.add('is-locked');
      if (closeBtn) closeBtn.focus();
    }

    function closeNav() {
      nav.classList.remove('is-open');
      overlay.classList.remove('is-visible');
      openBtn.setAttribute('aria-expanded', 'false');
      document.body.classList.remove('is-locked');

      var hide = function () { overlay.hidden = true; };
      if (reduceMotion) hide(); else window.setTimeout(hide, 280);

      if (lastFocused && typeof lastFocused.focus === 'function') lastFocused.focus();
    }

    openBtn.addEventListener('click', function () {
      nav.classList.contains('is-open') ? closeNav() : openNav();
    });
    if (closeBtn) closeBtn.addEventListener('click', closeNav);
    overlay.addEventListener('click', closeNav);

    nav.addEventListener('click', function (e) {
      if (e.target.closest('a') && nav.classList.contains('is-open')) closeNav();
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && nav.classList.contains('is-open')) closeNav();
    });

    // Focus trap
    nav.addEventListener('keydown', function (e) {
      if (e.key !== 'Tab' || !nav.classList.contains('is-open')) return;
      var f = nav.querySelectorAll('a[href], button:not([disabled]), input, select, textarea, [tabindex]:not([tabindex="-1"])');
      if (!f.length) return;
      var first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    });

    onMediaChange(DESKTOP, function (mq) {
      if (mq.matches && nav.classList.contains('is-open')) closeNav();
    });
  })();

  /* ========================================================================
     3. DROPDOWN MENU
     ======================================================================== */
  (function dropdowns() {
    var items = document.querySelectorAll('[data-dropdown]');
    if (!items.length) return;

    Array.prototype.forEach.call(items, function (item) {
      var trigger = item.querySelector('[data-dropdown-trigger]');
      if (!trigger) return;

      trigger.addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        var open = !item.classList.contains('is-open');

        // Tutup dropdown sibling di baris menu yang sama
        var siblings = item.parentNode ? item.parentNode.children : [];
        Array.prototype.forEach.call(siblings, function (sib) {
          if (sib === item || !sib.hasAttribute || !sib.hasAttribute('data-dropdown')) return;
          sib.classList.remove('is-open');
          var t = sib.querySelector('[data-dropdown-trigger]');
          if (t) t.setAttribute('aria-expanded', 'false');
        });

        item.classList.toggle('is-open', open);
        trigger.setAttribute('aria-expanded', String(open));
      });
    });

    function closeAll() {
      Array.prototype.forEach.call(items, function (item) {
        item.classList.remove('is-open');
        var t = item.querySelector('[data-dropdown-trigger]');
        if (t) t.setAttribute('aria-expanded', 'false');
      });
    }

    document.addEventListener('click', function (e) {
      var inside = false;
      Array.prototype.forEach.call(items, function (item) {
        if (item.contains(e.target)) inside = true;
      });
      if (!inside) closeAll();
    });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeAll(); });
  })();

  /* ========================================================================
     4. MAIN SLIDER — pengganti Swiper ".mySwiper"
        Di Laravel jumlah slide mengikuti @foreach ($sliders as $slider);
        skrip ini membaca berapa pun slide yang ada di DOM.
     ======================================================================== */
  (function mainSlider() {
    var root = document.querySelector('[data-slider]');
    if (!root) return;

    var track = root.querySelector('[data-slider-track]');
    var slides = track ? track.children : [];
    var pagination = root.querySelector('[data-slider-pagination]');
    var prev = root.querySelector('[data-slider-prev]');
    var next = root.querySelector('[data-slider-next]');
    var total = slides.length;
    if (!track || total === 0) return;

    var index = 0;
    var timer = null;
    var INTERVAL = 6000;

    // Satu slide saja: sembunyikan kontrol
    if (total < 2) {
      if (prev) prev.hidden = true;
      if (next) next.hidden = true;
      if (pagination) pagination.hidden = true;
      return;
    }

    // Bangun titik pagination
    var dots = [];
    if (pagination) {
      for (var i = 0; i < total; i++) {
        var dot = document.createElement('button');
        dot.type = 'button';
        dot.className = 'main-slider__dot';
        dot.setAttribute('role', 'tab');
        dot.setAttribute('aria-label', 'Slide ' + (i + 1) + ' dari ' + total);
        (function (n) {
          dot.addEventListener('click', function () { goTo(n); restart(); });
        })(i);
        pagination.appendChild(dot);
        dots.push(dot);
      }
    }

    function goTo(n) {
      index = (n + total) % total;
      track.style.transform = 'translateX(' + (-index * 100) + '%)';
      dots.forEach(function (d, i) {
        d.classList.toggle('is-active', i === index);
        d.setAttribute('aria-selected', String(i === index));
      });
      Array.prototype.forEach.call(slides, function (s, i) {
        s.setAttribute('aria-hidden', String(i !== index));
      });
    }

    function start() {
      if (reduceMotion) return;
      timer = window.setInterval(function () { goTo(index + 1); }, INTERVAL);
    }
    function stop() { if (timer) { window.clearInterval(timer); timer = null; } }
    function restart() { stop(); start(); }

    if (prev) prev.addEventListener('click', function () { goTo(index - 1); restart(); });
    if (next) next.addEventListener('click', function () { goTo(index + 1); restart(); });

    root.addEventListener('mouseenter', stop);
    root.addEventListener('mouseleave', start);
    root.addEventListener('focusin', stop);
    document.addEventListener('visibilitychange', function () {
      document.hidden ? stop() : restart();
    });

    // Geser dengan sentuhan
    var startX = 0, deltaX = 0, swiping = false;
    root.addEventListener('touchstart', function (e) {
      startX = e.touches[0].clientX; deltaX = 0; swiping = true; stop();
    }, { passive: true });
    root.addEventListener('touchmove', function (e) {
      if (swiping) deltaX = e.touches[0].clientX - startX;
    }, { passive: true });
    root.addEventListener('touchend', function () {
      if (swiping && Math.abs(deltaX) > 45) goTo(index + (deltaX < 0 ? 1 : -1));
      swiping = false; start();
    });

    // Panah kiri/kanan saat slider difokuskan
    root.addEventListener('keydown', function (e) {
      if (e.key === 'ArrowLeft') { goTo(index - 1); restart(); }
      if (e.key === 'ArrowRight') { goTo(index + 1); restart(); }
    });

    goTo(0);
    start();
  })();

  /* ========================================================================
     5. MARQUEE MITRA — pengganti Swiper ".mySwiper2" (autoplay loop)
     ======================================================================== */
  (function partnersMarquee() {
    var root = document.querySelector('[data-marquee]');
    if (!root) return;

    var track = root.querySelector('[data-marquee-track]');
    if (!track || !track.children.length) return;

    // Berhenti bila konten sudah muat seluruhnya atau animasi dimatikan
    function fits() { return track.scrollWidth <= root.clientWidth + 8; }
    if (reduceMotion || fits()) return;

    // Gandakan isi agar gulungan terlihat menyambung
    var original = Array.prototype.slice.call(track.children);
    original.forEach(function (node) {
      var clone = node.cloneNode(true);
      clone.setAttribute('aria-hidden', 'true');
      track.appendChild(clone);
    });

    var halfWidth = 0;
    function measure() {
      halfWidth = 0;
      original.forEach(function (n) { halfWidth += n.offsetWidth + 18; });
    }
    measure();
    window.addEventListener('resize', measure, { passive: true });

    var offset = 0;
    var speed = 0.45;          // piksel per frame
    var paused = false;
    track.style.transition = 'none';

    root.addEventListener('mouseenter', function () { paused = true; });
    root.addEventListener('mouseleave', function () { paused = false; });

    (function tick() {
      if (!paused && halfWidth > 0) {
        offset -= speed;
        if (Math.abs(offset) >= halfWidth) offset = 0;
        track.style.transform = 'translateX(' + offset + 'px)';
      }
      window.requestAnimationFrame(tick);
    })();
  })();

  /* ========================================================================
     6. REVEAL ON SCROLL
     ======================================================================== */
  (function revealOnScroll() {
    var targets = document.querySelectorAll('.reveal');
    if (!targets.length) return;

    if (reduceMotion || !('IntersectionObserver' in window)) {
      Array.prototype.forEach.call(targets, function (el) { el.classList.add('is-visible'); });
      return;
    }

    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('is-visible');
        observer.unobserve(entry.target);
      });
    }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

    Array.prototype.forEach.call(targets, function (el) { observer.observe(el); });
  })();

  /* ========================================================================
     7. PENANDA MENU AKTIF
        Menyamakan "about.html", "about", dan "/" supaya penanda tetap benar
        di file://, hosting statis, maupun route Laravel tanpa ekstensi.
     ======================================================================== */
  (function activeNav() {
    function normalise(path) {
      var name = (path || '').split('?')[0].split('#')[0].split('/').pop();
      if (!name) return 'index';
      return name.replace(/\.html$/, '');
    }

    var current = normalise(window.location.pathname);
    var links = document.querySelectorAll('.main-menu__list a[href], .mobile-nav__list a[href]');

    Array.prototype.forEach.call(links, function (link) {
      var href = link.getAttribute('href') || '';
      if (!href || href.charAt(0) === '#' || /^(https?:|mailto:|tel:)/.test(href)) return;
      if (normalise(href) !== current) return;

      link.classList.add('is-active');
      var top = link.closest('.main-menu__list > li, .mobile-nav__list > li');
      if (top) top.classList.add('is-active');
    });
  })();

  /* ========================================================================
     8. TOMBOL KEMBALI KE ATAS
     ======================================================================== */
  (function toTop() {
    var btn = document.querySelector('[data-to-top]');
    if (!btn) return;

    var ticking = false;
    function update() {
      btn.classList.toggle('is-visible', window.scrollY > 600);
      ticking = false;
    }
    window.addEventListener('scroll', function () {
      if (!ticking) { window.requestAnimationFrame(update); ticking = true; }
    }, { passive: true });

    btn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: reduceMotion ? 'auto' : 'smooth' });
    });

    update();
  })();

  /* ========================================================================
     10. SELF-ASSESSMENT — halaman Integrity Assessment
         Satu pertanyaan tampil pada satu waktu. Semua perhitungan dilakukan
         di peramban; tidak ada data yang dikirim ke mana pun.
         Bobot jawaban: Sudah = 2, Sebagian = 1, Belum = 0.
     ======================================================================== */
  (function assessment() {
    var root = document.querySelector('[data-quiz]');
    if (!root) return;

    var intro = root.querySelector('[data-quiz-intro]');
    var runner = root.querySelector('[data-quiz-runner]');
    var result = root.querySelector('[data-quiz-result]');
    var questions = root.querySelectorAll('[data-quiz-q]');
    if (!intro || !runner || !result || !questions.length) return;

    var startBtn = root.querySelector('[data-quiz-start]');
    var prevBtn = root.querySelector('[data-quiz-prev]');
    var nextBtn = root.querySelector('[data-quiz-next]');
    var retakeBtn = root.querySelector('[data-quiz-retake]');
    var bar = root.querySelector('[data-quiz-bar]');
    var pctOut = root.querySelector('[data-quiz-pct]');
    var currentOut = root.querySelector('[data-quiz-current]');
    var totalOut = root.querySelector('[data-quiz-total]');

    var total = questions.length;
    var MAX_PER_Q = 2;
    var index = 0;

    if (totalOut) totalOut.textContent = String(total);

    function t(key) {
      return (window.KAKI_I18N && window.KAKI_I18N.t) ? window.KAKI_I18N.t(key) : key;
    }

    function answerOf(q) {
      var checked = q.querySelector('input[type="radio"]:checked');
      return checked ? parseInt(checked.value, 10) : null;
    }

    function render() {
      Array.prototype.forEach.call(questions, function (q, i) {
        q.hidden = i !== index;
      });

      var done = index;                       // pertanyaan yang sudah dilewati
      var pct = Math.round((done / total) * 100);
      if (bar) {
        bar.style.width = pct + '%';
        bar.setAttribute('aria-valuenow', String(pct));
      }
      if (pctOut) pctOut.textContent = pct + '%';
      if (currentOut) currentOut.textContent = String(index + 1);

      if (prevBtn) prevBtn.disabled = index === 0;
      if (nextBtn) {
        nextBtn.disabled = answerOf(questions[index]) === null;
        var label = nextBtn.querySelector('[data-i18n]');
        if (label) {
          var key = index === total - 1 ? 'quiz.finish' : 'quiz.next';
          label.setAttribute('data-i18n', key);
          label.textContent = t(key);
        }
      }
    }

    function finish() {
      var score = 0;
      var gaps = [];
      var lang = (window.KAKI_I18N && window.KAKI_I18N.get) ? window.KAKI_I18N.get() : 'id';

      Array.prototype.forEach.call(questions, function (q) {
        var value = answerOf(q);
        if (value === null) return;
        score += value;
        if (value === 0) {
          gaps.push(q.getAttribute(lang === 'en' ? 'data-area-en' : 'data-area-id') || '');
        }
      });

      var pct = Math.round((score / (total * MAX_PER_Q)) * 100);
      var level = pct >= 75 ? 3 : (pct >= 40 ? 2 : 1);

      var scoreOut = root.querySelector('[data-quiz-score]');
      var titleOut = root.querySelector('[data-quiz-level-title]');
      var descOut = root.querySelector('[data-quiz-level-desc]');
      var gapsOut = root.querySelector('[data-quiz-gaps]');

      if (scoreOut) scoreOut.textContent = pct + '%';
      if (titleOut) {
        titleOut.setAttribute('data-i18n', 'quiz.lvl' + level + 'T');
        titleOut.textContent = t('quiz.lvl' + level + 'T');
      }
      if (descOut) {
        descOut.setAttribute('data-i18n', 'quiz.lvl' + level + 'D');
        descOut.textContent = t('quiz.lvl' + level + 'D');
      }

      if (gapsOut) {
        gapsOut.innerHTML = '';
        if (gaps.length) {
          gaps.forEach(function (area) {
            var li = document.createElement('li');
            li.textContent = area;
            gapsOut.appendChild(li);
          });
        } else {
          var li = document.createElement('li');
          li.className = 'quiz__gaps-none';
          li.setAttribute('data-i18n', 'quiz.noGaps');
          li.textContent = t('quiz.noGaps');
          gapsOut.appendChild(li);
        }
      }

      runner.hidden = true;
      result.hidden = false;
      result.focus();
    }

    function reset() {
      Array.prototype.forEach.call(root.querySelectorAll('input[type="radio"]'), function (i) {
        i.checked = false;
      });
      index = 0;
      result.hidden = true;
      intro.hidden = false;
      runner.hidden = true;
    }

    if (startBtn) {
      startBtn.addEventListener('click', function () {
        intro.hidden = true;
        runner.hidden = false;
        index = 0;
        render();
        runner.scrollIntoView({ behavior: reduceMotion ? 'auto' : 'smooth', block: 'start' });
      });
    }

    if (prevBtn) {
      prevBtn.addEventListener('click', function () {
        if (index > 0) { index--; render(); }
      });
    }

    if (nextBtn) {
      nextBtn.addEventListener('click', function () {
        if (answerOf(questions[index]) === null) return;
        if (index < total - 1) { index++; render(); }
        else finish();
      });
    }

    if (retakeBtn) {
      retakeBtn.addEventListener('click', function () {
        reset();
        intro.scrollIntoView({ behavior: reduceMotion ? 'auto' : 'smooth', block: 'start' });
      });
    }

    // Memilih jawaban langsung membuka tombol lanjut
    root.addEventListener('change', function (e) {
      if (e.target && e.target.type === 'radio') render();
    });

    // Label tombol ikut berubah saat bahasa diganti
    window.addEventListener('kaki:langchange', function () {
      if (!runner.hidden) render();
    });

    render();
  })();

  /* ========================================================================
     9. TAHUN OTOMATIS DI FOOTER
     ======================================================================== */
  (function currentYear() {
    var el = document.querySelector('[data-year]');
    if (el) el.textContent = String(new Date().getFullYear());
  })();

})();
