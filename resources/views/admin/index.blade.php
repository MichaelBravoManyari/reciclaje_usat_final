@extends('adminlte::page')

@section('title', 'ReciclaUSAT')

@section('content_header')
    
@stop

@section('content')
    <div class="p-2"></div>
    <div class="row">
        <div class="col-4">
            <div class="card">
                <div class="card-body">
                    <h1><strong>ReciclaUSAT</strong></h1>
                    <p>Bienvenido al panel de Administración de <b>Recicla</b>USAT</p><br>
                    <h5><strong>Integrantes:</strong></h5><br>
                    <ul>
                        <li>MICHAEL NICK BRAVO MANYARI</li><br>
                        <li>ROBERTO CARLOS MONTERO LOPEZ</li><br>
                        <li>STHEFANY LISETH TENORIO CALDERON</li><br>
                        <li>STEVEN JEANPIEERS VERA CARRANZA</li><br>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <img src="{{ asset('vendor/adminlte/dist/img/home.jpg') }}" alt="home" class="image-center" />
                </div>
            </div>
        </div>
    </div>
@stop

@section('css')
    <style>
        .image-center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 800px;
            height: 560px;
        }
    </style>
    
    <link rel="stylesheet" href="{{ asset('dist/custom.css') }}">
@stop
