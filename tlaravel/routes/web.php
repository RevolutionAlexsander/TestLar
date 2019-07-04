<?php

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


Route::get('/', ['as'=>'home',function () {
    return view('welcome');
}]);


Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

Route::post('/send-mail','IndexController@Add')->name('AddZ');
Route::post('/home','IndexController@Nomer')->name('Checkb');


//Route::get('/home','IndexController@Index');

//Route::get('/home', function () {
//    return view('home');
//});
//Route::resource('/home','ZayavkaController');
