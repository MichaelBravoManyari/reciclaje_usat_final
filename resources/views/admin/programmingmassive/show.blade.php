@extends('adminlte::page')

@section('title', 'Programación')

@section('content')
    <div class="p-3"></div>
    <div class="card">
        <div class="card-header">
            <div class="">
                <button class="btn btn-success float-right btnRoute" data-id="{{ $route_id }}">
                    <i class="fas fa-map-marker-alt"></i>&nbsp; Ver Ruta
                </button>
                <h3>Programación para esas fechas</h3>
            </div>
            <div class="">
                <p for=""><strong>Fecha de incio:</strong> {{ $programming->startdate }} </p>
                <p for=""><strong>Fecha final:</strong> {{ $programming->lastdate }} </p>
                <p for=""><strong>ID Ruta:</strong> {{ $route_id }} </p>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-striped" id="datatable">
                <thead>
                    <tr>
                        <th>DÍAS</th>
                        <th>VEHICULO</th>
                        <th>RUTA</th>
                        <th>HORA</th>
                        <th>HORARIO</th>
                        <th>ESTADO</th>
                        <th>DESCRIPCION</th>
                        <th width="10"></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <div class="card-footer">
        <a href="{{ route('admin.programmingmassive.index') }}" class="btn btn-danger float-right"><i
                class="fas fa-chevron-left"></i> Retornar</a>
    </div>

    <div class="modal fade" id="formModalMap" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Formulario de la ruta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
            </div>
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
                "ajax": "{{ route('admin.programmingmassive.show', $programming->id) }}",
                "columns": [{
                        "data": "date_route",
                    },
                    {
                        "data": "vehicle",
                    },
                    {
                        "data": "route",
                    },
                    {
                        "data": "time_route",
                    },
                    {
                        "data": "sname",
                    },
                    {
                        "data": "status",
                    },
                    {
                        "data": "description",
                    },
                    {
                        "data": "actions",
                        "orderable": false,
                        "searchable": false,
                    }
                ],
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                }
            });
        });

        function refreshTable() {
            var table = $('#datatable').DataTable();
            table.ajax.reload(null, false);
        }

        $(document).on('click', '.btnRoute', function() {
            var routeId = $(this).data('id');

            $.ajax({
                url: "{{ route('admin.showroutemap', ':route_id') }}".replace(':route_id',
                routeId),
                type: "GET",
                success: function(response) {
                    $("#formModalMap #exampleModalLabel").html("Mapa de la ruta del vehiculo");
                    $("#formModalMap .modal-body").html(
                    response);
                    $("#formModalMap").modal("show");
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                    alert("Hubo un error al obtener la información de la ruta.");
                }
            });
        });

        $(document).on('click', '.btnRouteMap', function() {
            var id = $(this).attr("id");

            $.ajax({
                url: "{{ route('admin.routepaths.show', 'id') }}".replace('id', id),
                type: "GET",
                success: function(response) {
                    $("#formModalMap #exampleModalLabel").html("Mapa de la ruta del vehiculo");
                    $("#formModalMap .modal-body").html(response);
                    $("#formModalMap").modal("show");                  
                }
            });
        })
    </script>
@stop
