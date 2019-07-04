@extends('layouts.app')

@section('content')
    {{--    <zayavkaIndex></zayavkaIndex>--}}
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="width: 1500px; left: -350px">
                <div class="panel panel-default">
                    @if(Auth::id()=='1')
                        <div class="panel-heading">Заявки</div>
                        <div class="panel-body">
                            @if (session('status'))
                                <div class="alert alert-success">
                                    {{ session('status') }}
                                </div>
                            @endif
                            <form id="contact" action="{{route('Checkb')}}" method="post">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Номер заявки</th>
                                        <th>Тема</th>
                                        <th>Сообщение</th>
                                        <th>Имя клиента</th>
                                        <th>Почта клиента</th>
                                        <th>Файл</th>
                                        <th>Время создания</th>
                                        <th>Просмотрено</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($res as $v)
                                        <tr>
                                            <th>{{$v->ID_Zayavka}}</th>
                                            <th>{{$v->Tema}}</th>
                                            <th>{{$v->Soobshenie}}</th>
                                            <th>{{$v->name}}</th>
                                            <th>{{$v->email}}</th>
                                            <th>{{$v->Ssilka}}</th>
                                            <th>{{$v->DataVr}}</th>
                                            <th>
                                                <input type="checkbox" name="Check[]" id="{{$v->ID_Zayavka}}"
                                                       class="Check" @if($v->Pr==1) checked @endif>
                                            </th>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    @else
                        <div class="panel-heading">Создание заявки</div>
                        <div class="panel-body">
                            @if (session('status'))
                                <div class="alert alert-success">
                                    {{ session('status') }}
                                </div>
                            @endif
                            <form method="post" action="{{route('AddZ')}}" enctype="multipart/form-data">
                                @if($date>0)
                                    <p>Сообщение отправлено, можно отправлять не более раза в сутки</p>
                                @else
                                    <label>Тема</label>
                                    <p><input type="text" name="Tema" autocomplete="off" required></p>
                                    <label>Сообщение</label>
                                    <p><input type="text" name="Soob" autocomplete="off" required></p>
                                    <label>Файл</label>
                                    <p><input type="file" name="File"></p>
                                    <p>
                                        <button type="submit">Отправить</button>
                                    </p>
                                    {{csrf_field()}}
                                @endif
                            </form>
                        </div>
                    @endif


                </div>
            </div>
        </div>
    </div>
@endsection
