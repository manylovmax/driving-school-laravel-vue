const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app/app.js', 'public/js/app.js')
	.sourceMaps()
	.version();
mix.sass('resources/sass/app/app.scss', 'public/css');

mix.js('resources/js/dashboard/login.js', 'public/js/dashboard-login.js')
	.sourceMaps()
	.version();
// dashboard section
// TODO: make private (staff only)

mix.js('resources/js/dashboard/app.js', 'public/js/dashboard.js')
	.sourceMaps()
	.version();
mix.sass('resources/sass/dashboard/dashboard.scss', 'public/css');
