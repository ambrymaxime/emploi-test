<?php
//? --- COMMENT HELLOCSE : Création de la table Stars et de la migration
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stars', function (Blueprint $table) {
            $table->id();
            // --- Globals
            $table->string('first_name', 255);
            $table->string('last_name', 255);
            $table->string('thumbnail')->default('/images/default.jpg');
            $table->text('description')->nullable($value = true);
            // --- Dates
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->nullable($value = true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('stars', function (Blueprint $table) {
            $table->dropForeign('id');
        });

        Schema::dropIfExists('stars');
    }
}
