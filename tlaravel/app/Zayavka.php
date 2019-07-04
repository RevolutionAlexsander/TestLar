<?php

namespace Test;

use Illuminate\Database\Eloquent\Model;

class Zayavka extends Model
{
    protected $table='Zayavka';
    protected $fillable=['Tema','Soobshenie','users_ID','Ssilka','DataVr','Pr'];
}
