@extends('adminlte::page')

@section('title', 'Historial de mantenimiento')


@section('content')
    <div class="p-2"></div>
    <div class="card">
        <div class="card-header">
            <h3>Historial de mantenimientos de los vehículos</h3>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-striped" id="datatable">
                <thead>
                    <tr>
                        <th>NOMBRE</th>
                        <th>FECHA INICIO</th>
                        <th>FECHA FINAL</th>
                        <th>DIA</th>
                        <th>FECHA</th>
                        <th>HORA INICIO</th>
                        <th>HORA FINAL</th>
                        <th>TIPO</th>
                        <th>VEHICULO</th>
                        <th>CONDUCTOR</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
@stop

@section('css')
    <link rel="stylesheet" href="{{ asset('dist/custom.css') }}">
@stop

@section('js')
    <script>
        $(document).ready(function() {
            var table = $('#datatable').DataTable({
                "ajax": "{{ route('admin.schedulesdates.index') }}", // La ruta que llama al controlador vía AJAX
                "columns": [
                    {
                        "data": "mname",
                    },
                    {
                        "data": "startdate",
                    },
                    {
                        "data": "lastdate",
                    },
                    {
                        "data": "sname",
                    },
                    {
                        "data": "date",
                    },
                    {
                        "data": "time_start",
                    },
                    {
                        "data": "time_end",
                    },
                    {
                        "data": "tname",
                    },
                    {
                        "data": "vname",
                    },
                    {
                        "data": "uname",
                    }
                ],
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                }
            });
        });

        $('#btnNuevo').click(function() {
            var url = window.location.href = "{{ route('admin.ocuppants.index') }}";

            $.ajax({
                url: url,
                success: function(response) {
                    console.log("Exitoso");
                },
                error: function(xhr, status, error) {
                    Swal.fire('Error', 'Hubo un problema al procesar la solicitud.', 'error');
                }
            });
        });
    </script>
@stop
