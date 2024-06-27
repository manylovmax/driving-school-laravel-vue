<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
  'prefix' => 'auth'
], function () {

  Route::post('login', 'API\AuthController@login');
  Route::post('signup', 'API\AuthController@signup');
  Route::get('signup/activate/{token}', 'API\AuthController@signupActivate');
  Route::get('recaptcha/{token}', 'API\AuthController@verifyRecaptcha');

  Route::group([
    'middleware' => 'auth:api'
  ], function() {
    Route::get('logout', 'API\AuthController@logout');
    Route::get('user', 'API\AuthController@user');
  });
});


Route::group([
  'namespace' => 'Auth',
  'prefix' => 'password'
], function () {
  Route::post('create', 'PasswordResetController@create');
  Route::get('find/{token}', 'PasswordResetController@find');
  Route::post('reset', 'PasswordResetController@reset');
});

Route::group([
  'middleware' => 'auth:api'
], function() {
  Route::get('group/all', 'API\GroupController@all');
  Route::apiResource('group', 'API\GroupController');
  Route::apiResource('user', 'API\UserController');
  Route::get('user/trashed', 'API\UserController@trashed');
  Route::apiResource('personal-training', 'API\PersonalTrainingController');
  Route::get('export', 'API\ExportController@index');
});

Route::get('public-group', 'API\PublicGroupController@index');
Route::get('personal-training-public', 'API\PublicPersonalTrainingController@index');
