<?php

namespace Test\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $RegId=Auth::id();
        if($RegId==1){
            $results = DB::select
            ('select ID_Zayavka,Tema,Soobshenie,users.name,users.email,Ssilka,DataVr,Pr
                from Zayavka inner join users on users_ID=id');
//            var_dump($results);
            return view('home')->with('res',$results);
        }else{
            $result=DB::table('Zayavka')->select('DataVr')->
            where('users_ID','=',$RegId)->orderBy('DataVr','desc')->first();
            if(!empty($result)){
                $date=0;
                foreach ($result as $v){
                    $date=$v;
                }
                $date=new Carbon($date);
                $tom=$date->addDay();
                $raz=Carbon::now()->diffInHours($tom,false);
                return view('home')->with('date',$raz);
            }
            else{
                $date=-1;
                return view('home')->with('date',$date);
            }

        }
    }
}
