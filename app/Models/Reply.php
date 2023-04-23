<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Reply
 *
 * @property $id
 * @property $post_id
 * @property $respuesta
 * @property $created_at
 * @property $updated_at
 *
 * @property Post $post
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Reply extends Model
{
    
    static $rules = [
		'respuesta' => 'required',
    ];

    protected $perPage = 20;

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['post_id','respuesta'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function post()
    {
        return $this->hasOne('App\Models\Post', 'id', 'post_id');
    }
    

}
