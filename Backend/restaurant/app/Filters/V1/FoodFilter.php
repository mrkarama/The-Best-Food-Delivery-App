<?php
namespace App\Filters\V1;
use Illuminate\Http\Request;

class FoodFilter{

    protected $safeParams =[
        'id' => ['eq', 'lt', 'lte', 'gt', 'gte', 'ne'],
        'title' => ['eq','ne'],
        'description' => ['eq','ne'],
        'price' => ['eq', 'lt', 'lte', 'gt', 'gte', 'ne'],
        'rating' => ['eq', 'lt', 'lte', 'gt', 'gte', 'ne'],
        'category' => ['eq','ne'],
    ];

    protected $operatorsMap = [
        'eq' => '=',
        'lt' => '<',
        'lte' => '<=',
        'gt' => '>',
        'gte' => '>=',
        'ne' => '!=',
    ];

    public function transform(Request $request){
        $eloQuery = [];

        foreach($this->safeParams as $param=>$operators){
            $query = $request->query($param);

            if (!isset($query)){
                continue;
            }

            $column = $param;

            foreach($operators as $operator){
                if (isset($query[$operator])){
                    $eloQuery[] = [$column, $this->operatorsMap[$operator], $query[$operator]];
                }
            }
        }

        return $eloQuery;
    }
}

