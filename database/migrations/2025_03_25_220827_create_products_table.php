<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description');
            $table->unsignedBigInteger('brand_id');
            $table->unsignedBigInteger('origin_id');
            $table->integer('is_published');
            $table->softDeletes();
            $table->timestamps();
            $table->foreign('brand_id')->references('id')->on('brands')->onUpdate('casCade')->onDelete('casCade');
            $table->foreign('origin_id')->references('id')->on('origins')->onUpdate('casCade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
