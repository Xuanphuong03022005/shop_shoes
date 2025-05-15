<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('product_id');
            $table->integer('size');
            $table->string('color');
            $table->integer('price');
            $table->integer('quantity');
            $table->integer('is_cancel')->default(0);
            $table->softDeletes();
            $table->timestamps();
            $table->foreign('product_id')->references('id')->on('products')->onUpdate('casCade')->onDelete('casCade');
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('casCade')->onDelete('casCade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order_details');
    }
}
