<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateUserRequest extends FormRequest
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
            'birthday' => 'before_or_equal:today',
            'avatar' => 'mimes:jpg,png,jpeg',
            'email' => 'email',
            'email' => 'unique:users',
            'password' => 'max:12',
            'address' => 'regex:/^[A-Za-z0-9À-ỹ,\s\W]+$/',
            'user_name' => 'unique:users',
            'phone' => 'digits:10',
            'full_name' => 'required|regex:/^[A-Za-zÀ-ỹ\s]+$/'
        ];
    }
    public function messages()
    {
        return [
            'birthday.before_or_equal' => 'Ngày tháng năm sinh không hợp lệ',
            'avatar.mimes' => 'Kiểu ảnh không đúng định dạng',
            'password.max' => 'Đã vượt quá 12 kí tự',
            'address.regex' => 'Không được có kí tự đặt biệt',
            'user_name.unique' => 'Tên tài khoản đã tồn tại',
            'email.unique' => 'Email đã tồn tại',
            'phone.digits' => 'Số điện thoại quy định 10 số',
            'full_name.regex' => 'Tên chỉ bao gồm chữ cái',
            'email.email' => 'Địa chỉ email không hợp lệ'
        ];
    }
}
