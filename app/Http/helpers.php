<?php

namespace App\Http;

use Request;

class Helpers
{
    public static function set_active($path_array = [])
    {
        return in_array(Request::path(), $path_array) ? 'active' : '';
    }
}
