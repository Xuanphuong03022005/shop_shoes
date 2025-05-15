<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateFoodRequest extends FormRequest
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
     * @return array
     */
   public function rules()
    {
        return [
            "name" => 'regex:/^[A-Za-zÃ-ỹ0-9\s\W]+$/',
            "image" => 'mimes:jpg,png,jpeg,webp,jfif',
            "price" => 'numeric|min:0',
            "description" => 'required',
            "category_id" => "exists:mfs,id"
        ];
    }
    public function messages()
    {
        return [
            "name.regex" => 'Tên đồ ăn không hợp lệ.',
            "image.mimes" => 'Chỉ nhận ảnh có đuôi png, webp, jpeg và jpg.',
            "price.numeric" => 'giá tiền phải là số thực.',
            "price.min" => 'giá tiền phải lớn hơn 0.',
            "description.required" => 'Không được bỏ trống chú thích',
            "category_id.exists" => 'Mục phân loại không hợp lệ.',
        ];
    }
}
