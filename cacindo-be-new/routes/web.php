<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\AdminIndex;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\PartnersController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WelcomeController;
use App\Mail\ContactUs;
use App\Models\About;
use App\Models\Blog;
use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/',  [WelcomeController::class, 'index'])->name('landingpage');
Route::get('/media/{id}', [MediaController::class, 'showPublic'])->name('medias.showPublic');
Route::get('/event/{id}', [EventController::class, 'showPublic'])->name('events.showPublic');
Route::get('/about',[WelcomeController::class, 'showabout'])->name('about');
Route::get('/member',[WelcomeController::class, 'showmember'])->name('member');
Route::get('/how-kaki-work',[WelcomeController::class, 'showhow'])->name('how');
Route::get('/why-kaki',[WelcomeController::class, 'showwhy'])->name('why');
Route::get('/benefit',[WelcomeController::class, 'showbenefit'])->name('benefit');
Route::get('/contact',[WelcomeController::class, 'showcontact'])->name('contact');
Route::get('/seminar',[WelcomeController::class, 'showseminar'])->name('seminar');
Route::get('/training',[WelcomeController::class, 'showtraining'])->name('training');
Route::get('/media',[WelcomeController::class, 'showmedia'])->name('media');
Route::get('/news',[WelcomeController::class, 'shownews'])->name('news');
Route::get('/in-the-news',[WelcomeController::class, 'showinthenews'])->name('inthenews');
Route::get('/video',[WelcomeController::class, 'showvideo'])->name('video');
Route::get('/image',[WelcomeController::class, 'showimage'])->name('image');
Route::get('/podcast',[WelcomeController::class, 'showpodcast'])->name('podcast');

Route::get('locale/{locale}', function ($locale){
    Session::put('locale', $locale);
    return redirect()->back();
});


Route::get('/dashboard', function () {
    return redirect()->route('admin.index');
})->middleware(['auth'])->name('dashboard');

Route::middleware(['auth', 'verified', 'can:admin access'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', AdminIndex::class)->name('index');

    // roles & permissions
    Route::resource('/permissions', PermissionController::class)->except(['show']);
    Route::resource('/roles', RoleController::class)->except(['show']);

    // users
    Route::resource('/users', UserController::class);

    // medias
    Route::resource('/medias', MediaController::class);

    // application form
    // Route::any('/application-form', ApplicationFormController::class)->name('application.form.any');

    // blogs | comment this route below to disable Blog features
    Route::resource('/blogs', BlogController::class);
    Route::resource('/events', EventController::class);
    Route::resource('/medias', MediaController::class);
    Route::resource('/pages', PageController::class);
    Route::resource('/sliders', SliderController::class);
    Route::resource('/partners', PartnersController::class);
    // bulk delete
    Route::delete('/bulk-delete/permissions', [PermissionController::class, 'massDelete'])->name('permissions.bulkDelete');
    Route::delete('/bulk-delete/roles', [RoleController::class, 'massDelete'])->name('roles.bulkDelete');
    Route::delete('/bulk-delete/users', [UserController::class, 'massDelete'])->name('users.bulkDelete');
    Route::delete('/bulk-delete/partners', [PartnersController::class, 'massDelete'])->name('partners.bulkDelete');
    Route::delete('/bulk-delete/sliders', [SliderController::class, 'massDelete'])->name('sliders.bulkDelete');
    Route::delete('/bulk-delete/medias', [mediaController::class, 'massDelete'])->name('medias.bulkDelete');
    Route::delete('/bulk-delete/blogs', [BlogController::class, 'massDelete'])->name('blogs.bulkDelete');
    Route::delete('/bulk-delete/events', [EventController::class, 'massDelete'])->name('events.bulkDelete');
    Route::delete('/bulk-delete/pages', [PageController::class, 'massDelete'])->name('pages.bulkDelete');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('account/verify-new-email/{token}', [AccountController::class, 'verifyNewEmail'])->name('account.verifyNewEmail');
    Route::resource('account', AccountController::class)->only(['index', 'edit', 'update']);
});

// sample captcha : start
// Route::view('/test', 'test');

Route::get('/reload-captcha', function () {
    return response()->json(['captcha' => captcha_img('math')]);
});

Route::post('/send-email', function () {
    $request = request();

    $request->validate([
        'company_name' => ['required', 'string'],
        'name' => ['required', 'string'],
        'location' => ['required', 'string'],
        'phone' => ['required', 'string'],
        'message' => ['required', 'string']
    ]);

    Mail::to('mailweb@sentralsistemindonesia.com')->send(new ContactUs($request));

    if ($request->notCheck) {
        $landingPage = route('landingpage') . '#section-contact-us';

        return redirect($landingPage)->with('sent', 'Email sent!');
    }

    return redirect()->route('check.media')->with('success', 'Email sent');
})->name('contactus.email');

require __DIR__ . '/auth.php';
