@extends('adminlte::page')

@section('title', 'ReciclaUSAT')

@section('content')
    <div class="p-2"></div>
    <div class="card">
        <div class="card-header">
            <button class="btn btn-success float-right ml-2" id="btnNuevoCoordEnd" data-id={{ $route->id }}><i class="fas fa-plus"></i>Agregar coordenada de fin</button>
            <button class="btn btn-success float-right ml-2" id="btnNuevoCoordStart" data-id={{ $route->id }}><i class="fas fa-plus"></i>Agregar coordenada de inicio</button>
            <button class="btn btn-success float-right" id="btnNuevoZone" data-id={{ $route->id }}><i class="fas fa-plus"></i>Agregar zona</button>
            <h3>Coordenadas de la ruta</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <label for="">Ruta:</label>
                            <p>{{ $route->name }}</p>
                            <label for="">Estado:</label>
                            <p>{{ $route->status == 1 ? 'Activo' : 'No Activo'}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="mb-3">
                                <h4 class="font-weight-bold">Zonas por donde pasa la ruta</h4>
                            </div>
                            <table id="datatable_zone" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>NOMBRE</th>
                                        <th>ELIMINAR</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="mb-3">
                                <h4 class="font-weight-bold">Coordenadas de Inicio y Fin</h4>
                            </div>
                            <table id="datatable_coord" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>TIPO</th>
                                        <th>LATITUD</th>
                                        <th>LONGITUD</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="card-footer">
            <a href="{{ route('admin.routes.index') }}" class="btn btn-danger float-right"><i class="fas fa-chevron-left"></i> Retornar</a>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Coordenadas</h5>
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
            $('#datatable_coord').DataTable({
                "ajax": {
                    "url": "{{ route('admin.routes.show', $route->id) }}",
                    "data": {"type": "coords"},
                },
                "columns": [
                    {
                        "data": "type",
                        "orderable": false,
                        "searchable": false,
                    },
                    {
                        "data": "latitude",
                        "orderable": false,
                        "searchable": false,
                    },
                    {
                        "data": "longitude",
                        "orderable": false,
                        "searchable": false,
                    }
                ],
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                }
            });

            $('#datatable_zone').DataTable({
                "ajax": {
                    "url": "{{ route('admin.routes.show', $route->id) }}",
                    "data": {"type": "zones"},
                },
                "columns": [
                    {
                        "data": "zone_name"
                    },
                    {
                        "data": "delete",
                        "orderable": false,
                        "searchable": false,
                    },
                ],
                "language": {
                    "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                }
            });
        });

        $('#btnNuevoCoordStart').click(function() {
            var id = $(this).attr('data-id');
            var type = 'start_coord';
            $.ajax({
                url: "{{ route('admin.showeditcoordinatesform', ['_id', '_type']) }}".replace('_id', id).replace('_type', type),
                type: "GET",
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Agregar coordenada de inicio");
                    $("#formModal .modal-body").html(response);
                    $("#formModal").modal("show");

                    $("#formModal form").on("submit", function(e) {
                        e.preventDefault();

                        var form = $(this);
                        var formData = new FormData(this);

                        $.ajax({
                            url: form.attr('action'),
                            type: form.attr('method'),
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                $("#formModal").modal("hide");
                                refreshTableCoords();
                                Swal.fire('Proceso existoso', response.message,
                                    'success');
                            },
                            error: function(xhr) {
                                var response = xhr.responseJSON;
                                Swal.fire('Error', response.message, 'error');
                            }
                        })

                    })

                }
            });
        });

        $('#btnNuevoCoordEnd').click(function() {
            var id = $(this).attr('data-id');
            var type = 'end_coord';
            $.ajax({
                url: "{{ route('admin.showeditcoordinatesform', ['_id', '_type']) }}".replace('_id', id).replace('_type', type),
                type: "GET",
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Agregar coordenada de fin");
                    $("#formModal .modal-body").html(response);
                    $("#formModal").modal("show");

                    $("#formModal form").on("submit", function(e) {
                        e.preventDefault();

                        var form = $(this);
                        var formData = new FormData(this);

                        $.ajax({
                            url: form.attr('action'),
                            type: form.attr('method'),
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                $("#formModal").modal("hide");
                                refreshTableCoords();
                                Swal.fire('Proceso existoso', response.message,
                                    'success');
                            },
                            error: function(xhr) {
                                var response = xhr.responseJSON;
                                Swal.fire('Error', response.message, 'error');
                            }
                        })

                    })

                }
            });
        });

        $('#btnNuevoZone').click(function() {
            var id = $(this).attr('data-id');
            $.ajax({
                url: "{{ route('admin.routezones.create') }}",
                type: "GET",
                data: { route_id: id },
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Agregar una zona a la ruta");
                    $("#formModal .modal-body").html(response);
                    $("#formModal").modal("show");

                    $("#formModal form").on("submit", function(e) {
                        e.preventDefault();

                        var form = $(this);
                        var formData = new FormData(this);

                        $.ajax({
                            url: form.attr('action'),
                            type: form.attr('method'),
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                $("#formModal").modal("hide");
                                refreshTableRoutezones();
                                Swal.fire('Proceso existoso', response.message,
                                    'success');
                            },
                            error: function(xhr) {
                                var response = xhr.responseJSON;
                                Swal.fire('Error', response.message, 'error');
                            }
                        })

                    })
                }
            });
        });

        $(document).on('submit', '.frmEliminar', function(e) {
            e.preventDefault();
            var form = $(this);
            Swal.fire({
                title: "Está seguro de eliminar?",
                text: "Está acción no se puede revertir!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si, eliminar!"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: form.attr('action'),
                        type: form.attr('method'),
                        data: form.serialize(),
                        success: function(response) {
                            refreshTableRoutezones();
                            Swal.fire('Proceso existoso', response.message, 'success');
                        },
                        error: function(xhr) {
                            var response = xhr.responseJSON;
                            Swal.fire('Error', response.message, 'error');
                        }
                    });
                }
            });
        });

        function refreshTableCoords() {
            var table_coords = $('#datatable_coord').DataTable();
            table_coords.ajax.reload(null, false); 
        }

        function refreshTableRoutezones() {
            var table_zones = $('#datatable_zone').DataTable();
            table_zones.ajax.reload(null, false); 
        }
    </script>
@endsection
