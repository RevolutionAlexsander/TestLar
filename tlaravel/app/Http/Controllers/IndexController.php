<?php

namespace Test\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Response;
use Test\Mail\MailClass;
use Test\Zayavka;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function Add(Request $request)
    {
        $name = 0;
        $mail = 0;
        $tema = $request->input('Tema');
        $soob = $request->input('Soob');
        $user = Auth::id();
        $results = DB::select('select name,email from users where id = :id', ['id' => $user]);
        foreach ($results as $v) {
            $name=$v->name;
            $mail=$v->email;
        }
        move_uploaded_file($_FILES['File']['tmp_name'],public_path("img/").$_FILES['File']['name']);
        $file=public_path("img/").$_FILES['File']['name'];
        var_dump($file);
        $DT = Carbon::now();
        DB::insert('insert into Zayavka (Tema,Soobshenie,users_ID,Ssilka,DataVr,Pr) values (?, ?, ?, ?, ?,?)',
            [$tema, $soob, $user, $file, $DT, 0]);
        Mail::to($mail)->queue(new MailClass($tema, $soob, $name, $file, $DT));
        return redirect('/home');
    }

    public function Nomer(Request $request)
    {
        $response = $request->input('id');
        $id = $request->input('id');
//        var_dump($id);
        DB::update('update Zayavka set Pr = 1 where ID_Zayavka = ?', [$id]);
        return Response::json($response);
    }
}
