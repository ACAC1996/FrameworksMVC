<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Post
 *
 * @property $id
 * @property $name
 * @property $category_id
 * @property $description
 * @property $state
 * @property $created_at
 * @property $updated_at
 * @property $autor_id
 *
 * @property Category $category
 * @property User $user
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Post extends Model
{
    
    static $rules = [
		'state' => 'required',
    ];

    protected $perPage = 20;

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['name','category_id','description','state','autor_id'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function category()
    {
        return $this->hasOne('App\Models\Category', 'id', 'category_id');
    }

    public function user()
    {
      return $this->hasOne('App\Models\User','id','autor_id');
    }
    
    public function replies()
    {
      return $this->hasMany('App\Models\Reply');
    }

    public function image(){
      return $this->hasOne(PostImage::class);
    }
    

}
