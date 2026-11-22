<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Api\V1\Food;
use App\Http\Requests\Api\V1\StoreFoodRequest;
use App\Http\Requests\Api\V1\UpdateFoodRequest;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\FoodBulkStoreRequest;
use App\Http\Resources\Api\V1\FoodResource;
use App\Http\Resources\Api\V1\FoodCollection;
use App\Filters\V1\FoodFilter;
use Illuminate\Http\Request;
class FoodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $filter = new FoodFilter();

        $filterItems = $filter->transform($request);

        $foods = Food::where($filterItems)->paginate();
        $products = new FoodCollection($foods->append($request->query()));

        $data = [
            'totalCount' => count($products),
            'products' => $products
        ];

        return response() -> json($data, 200);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreFoodRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFoodRequest $request)
    {
        $product = Food::create($request->all());

        $data = [
            'message' => 'Product inserted sucessfully.',
            'product' => $product
        ];

        return response() -> json($data, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Api\V1\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function show(Food $food)
    {
        $data = new FoodResource($food);

        return response()->json($data, 200);
    }


    // Multiple products storing

    public function bulkStore(FoodBulkStoreRequest $request){
        $products = Food::insert($request->all());

        $data = [
            'message' => 'Products succesfully inserted.'
        ];
        return response() -> json($data, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateFoodRequest  $request
     * @param  \App\Models\Api\V1\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateFoodRequest $request, Food $food)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Api\V1\Food  $food
     * @return \Illuminate\Http\Response
     */
    public function destroy(Food $food)
    {
        //
    }
}
