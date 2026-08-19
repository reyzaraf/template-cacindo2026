<section class="contact-us py-5" id="section-contact-us" style="background-color: #01a449">
    <div class="container">
        <h2 class="section-title text-center text-green" style="color: white">
            Contact Us
        </h2>

        <div class="row gx-lg-5 pt-4">
            <div class="col-lg-6 pt-5">
                <div class="align-items-start d-flex">
                    <span class="me-3 mt-2"><i class="fa-solid fa-phone" style="font-size: 16px"></i></span>
                    <p class="pl-3">
                        <span class="fw-bold" style="font-weight: bold">Phone</span><br /><a
                            href="tel:+6281283901573">+6221 82769272</a>
                    </p>
                </div>

                <div class="align-items-start d-flex">
                    <span class="me-3 mt-2"><i class="fa-solid fa-envelope-open-text"
                            style="font-size: 16px"></i></span>
                    <p class="pl-3">
                        <span class="fw-bold" style="font-weight: bold">Email</span><br /><a
                            href="mailto:info@sentralsistemindonesia.com">info@sentralsistemindonesia.com</a>
                    </p>
                </div>

                <div class="align-items-start d-flex">
                    <span class="me-3 mt-2"><i class="fa-solid fa-location-dot" style="font-size: 16px"></i></span>
                    <p class="pl-3">
                        <span class="fw-bold" style="font-weight: bold">Location</span><br />Perkantoran
                        East View Residence F/5A<br />
                        Jl. Raya Mustika Sari, Bekasi Timur <br />
                        Bekasi, 17158 Jawa Barat - Indonesia
                    </p>
                </div>
            </div>

            <div class="col-lg-6 mt-5">
                @if (session('sent'))
                    <p>{{ session('sent') }}</p>
                @endif
                <form class="contact-form" method="POST" action="{{ route('contactus.email') }}?notCheck=1">
                    @csrf
                    {{-- <input type="hidden" name="_token" value="ZFgPRi5EZHLz8uSldspPZN9Qwm919I1v1PRaAoYg" /> --}}
                    <input class="contact-input shadow-none border-0 form-control" type="text"
                        placeholder="Company Name" aria-label="company-name" name="company_name" required />

                    <input class="contact-input shadow-none border-0 form-control" type="text"
                        placeholder="Your Name" aria-label="your-name" name="name" required />

                    <input class="contact-input shadow-none border-0 form-control" type="text" placeholder="Location"
                        aria-label="location" name="location" required />

                    <input class="contact-input shadow-none border-0 form-control" type="text"
                        placeholder="Phone Number" aria-label="phone-number" name="phone" required />

                    <textarea name="message" id="" cols="30" rows="3"
                        class="contact-input shadow-none border-0 form-control" placeholder="Message"></textarea>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn submit d-inline-block py-2 px-3"
                            style="background-color: white; color: #41b574">
                            Send
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
