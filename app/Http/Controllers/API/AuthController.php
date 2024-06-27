<?php

namespace App\Http\Controllers\API;

use Avatar;
use Storage;
use Mail;
use Carbon\Carbon;
use App\User;
use App\Group;
use App\Notifications\SignupActivate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    const RECAPTCHA_SECRET = '6Le0hX4UAAAAADAnmPoT8L967BH4F4Jtr5pi9oQk';
    const RECAPTCHA_URL = 'https://www.google.com/recaptcha/api/siteverify';
    /**
        * Create user
        *
        * @param  [string] name
        * @param  [string] phone
        * @param  [string] email
        * @param  [string] password
        * @param  [string] password_confirmation
        * @return [string] message
        */
    public function signup(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'surname' => 'required|string',
            'phone' => 'required|string',
            'group_id' => 'required|integer',
            'email' => 'nullable|sometimes|string|email|unique:users',
        ]);

        $user = new User([
            'name' => $request->name,
            'surname' => $request->surname,
            'phone' => $request->phone,
            'group_id' => $request->group_id,
            'email' => $request->email,
            'password' => bcrypt('vue'),
            'activation_token' => str_random(60)
        ]);

        $user->save();

        // $avatar = Avatar::create($user->name)->getImageObject()->encode('png');
        // Storage::put('avatars/'.$user->id.'/avatar.png', (string) $avatar);

        $user->notify(new SignupActivate($user));

        // Mail::send('mails.new_user', $service_mail_data, function($message) {
        //     $message
        //         ->to(env('MAIL_CLONE_TO_ADDRESS'))
        //         ->subject('Новая регистрация')
        //         ->from(env('MAIL_FROM_ADDRESS'));
        //  });
        //  $Group = \App\Group::find($request->group_id);
        //  $groupName = $Group->name;
 
        //  $service_mail_data = [
        //      'name' => $request->name,
        //      'surname' => $request->surname,
        //      'phone' => $request->phone,
        //      'group' => $groupName,
        //      'email' => $request->email,
        //  ];
        // $admin->notify(new SignupActivate($user));

        return response()->json([
            'message' => 'Successfully created user!'
        ], 201);
    }

    /**
     * Confirm your account user (Activate)
     *
     * @param  [type] $token
     * @return [string] message
     * @return [obj] user
     */
    public function signupActivate($token)
    {
        $user = User::where('activation_token', $token)->first();
        if (!$user) {
            return response()->json([
            'message' => 'This activation token is invalid.'
        ], 404);
        }
        $user->active = true;
        $user->activation_token = '';
        $user->save();

        return "Email подтвержден!";
    }

    /**
     * Login user and create token
     *
     * @param  [string] email
     * @param  [string] phone
     * @param  [string] password
     * @param  [boolean] remember_me
     * @return [string] access_token
     * @return [string] token_type
     * @return [string] expires_at
     */
    public function login(Request $request)
    {
        $request->validate([
            // 'email' => 'nullable|sometimes|string|email',
            'email' => 'required|string|email',
            // 'phone' => 'required|string',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);
        $credentials = $request->only(['email', 'password']);
        // $credentials['active'] = 1;
        // $credentials['deleted_at'] = null;


        $user = User::where('email', 'admin@email.ru')->first();
        if (!$user) {
            return response()->json([
            'message' => 'This activation token is invalid.'
        ], 404);
        }
        // $password_hash = Hash::make('easypass');
        // $user->password = $password_hash;
        // $user->save();

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        }
        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->token;
        if ($request->remember_me) {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }
        $token->save();
        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString()
        ]);
    }

    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }

    public function verifyRecaptcha(Request $request, string $token)
    {
      $googleResponse = self::makeRequestToGoogle($token, $request->ip());

      return response()->json($googleResponse, 200);
    }

    private static function makeRequestToGoogle($token, $clientIp = null)
    {
        $client = new \GuzzleHttp\Client();

        $payload = [
          'secret'   => self::RECAPTCHA_SECRET,
          'response' => $token,
        ];

        if ($clientIp != '127.0.0.1')
          $payload['remoteip'] = $clientIp;

        $response = $client->post(self::RECAPTCHA_URL, ['json' => $payload]);
        $body = $response->getBody();

        return $body;
    }
}
