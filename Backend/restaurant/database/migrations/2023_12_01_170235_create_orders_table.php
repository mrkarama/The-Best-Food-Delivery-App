<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
             $table->id();
            $table->integer('user_id');
            $table->decimal('order_amount', 8, 2);
            $table->string('payment_status')->nullable()->default('pending');
            $table->string('payment_method')->nullable();
            $table->string('transaction_reference')->nullable();
            $table->string('order_status')->default('pending');
            $table->timestamp('confirmed')->nullable();
            $table->timestamp('accepted')->nullable();
            $table->boolean('scheduled')->default(0);
            $table->timestamp('processing')->nullable();
            $table->timestamp('handover')->nullable();
            $table->timestamp('failed')->nullable();
            $table->timestamp('scheduled_at')->nullable();
            $table->integer('delivery_address_id')->nullable();
            $table->text('order_note')->nullable();
            $table->text('delivery_address');
            $table->integer('otp');
            $table->timestamp('pending')->nullable();
            $table->timestamp('picked_up')->nullable();
            $table->timestamp('delivered')->nullable();
            $table->timestamp('canceled')->nullable();
            $table->decimal('delivery_charge', 6, 2)->nullable();
            $table->timestamps();
            $table->string('delivery_options');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
