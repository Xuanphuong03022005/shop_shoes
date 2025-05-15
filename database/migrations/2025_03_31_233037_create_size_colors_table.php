<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSizeColorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('size_colors', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('size_id');
            $table->unsignedBigInteger('color_id');
            $table->softDeletes();
            $table->timestamps();
            $table->foreign('size_id')->references('id')->on('sizes')->onUpdate('casCade')->onDelete('casCade');
            $table->foreign('color_id')->references('id')->on('colors')->onUpdate('casCade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('size_colors');
    }
}
