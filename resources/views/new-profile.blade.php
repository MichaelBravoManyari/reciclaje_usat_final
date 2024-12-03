@extends('adminlte::page')

@section('title', 'Acceso Denegado')

@section('content')
    <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card" style="max-width: 500px; width: 100%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <div class="card-header text-center">
                <i class="fas fa-times-circle" style="font-size: 40px; color: #e74c3c;"></i><br>
                <h3 class="text-danger">Acceso Denegado</h3>
            </div>
            <div class="card-body text-center">
                <p>Tu usuario no tiene permisos para navegar por esta página. Porque aún no te han asignado un tipo de usuario.</p>
                <p>Por favor comunicate con el administrador.</p>
                <a href="{{ route('logout') }}" class="btn btn-primary mb-2" 
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    Cerrar Sesión
                </a>
                <form id="logout-form" method="POST" action="{{ route('logout') }}" style="display: none;">
                    @csrf
                </form>
            </div>
        </div>
    </div>
@stop

@section('css')
<link rel="stylesheet" href="{{ asset('dist/custom.css') }}">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
        }

        .card {
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header h3 {
            font-size: 24px;
            color: #e74c3c;
        }

        .card-body p {
            font-size: 18px;
            color: #555;
        }

        .btn {
            background-color: #051223;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #41b9a1;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .card {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
@stop

@section('js')
    <script>
    </script>
@stop