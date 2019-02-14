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

Route::get('/', function () {
    return view('accueil');
});

Route::get('/accueil', function () {
    return view('accueil');
});

Route::get('/inscription', function () {
    return view('inscription');
});

Route::get('/connexion', function () {
    return view('connexion');
});
Route::get('/contact', function () {
    return view('contact');
});
