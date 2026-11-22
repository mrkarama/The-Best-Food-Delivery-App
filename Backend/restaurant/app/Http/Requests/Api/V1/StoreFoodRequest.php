<?php

namespace App\Http\Requests\Api\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreFoodRequest extends FormRequest
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
            'title' => ['required', 'string'],
            'description' => ['required', 'string'],
            'category' => ['required', 'string'],
            'image' => ['required', 'unique:restaurant.food,image'],
            'price' => ['required', 'numeric'],
            'rating' => ['required', 'numeric', Rule::in([1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5])],
        ];
    }
}
