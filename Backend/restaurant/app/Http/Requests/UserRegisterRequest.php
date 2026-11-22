<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'name' => ['required', 'string', 'min:4'],
            'email' => ['required', 'email', 'unique:restaurant.users,email'],
            'password' => ['required', 'string', 'min:6'],
            'phone' => ['required', 'numeric', 'min:8'],
            //'email_verified_at' => ['required', 'date_format:Y-m-d H:i:s'],
        ];
    }
}
