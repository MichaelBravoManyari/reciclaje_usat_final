@extends('adminlte::page')

@section('title', 'ReciclaUSAT')

@section('content')
    <div class="p-2"></div>
    <div class="card">
        <div class="card-header">
            <button class="btn btn-success float-right" id="btnNuevo" data-id={{ $vehicleroute->vehicleroute_id }}><i class="fas fa-plus"></i>
                Agregar</button>

            <h3>Agregar coordenadas a la ruta</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <div class="card">
                        <div class="card-body">
                            <label for="">Vehiculo:</label>
                            <p>{{ $vehicleroute->vehicle_name }}</p>
                            <label for="">Fecha:</label>
                            <p>{{ $vehicleroute->date_route }}</p>
                            <label for="">Hora:</label>
                            <p>{{ $vehicleroute->time_route }}</p>
                            <label for="">Horario:</label>
                            <p>{{ $vehicleroute->schedule_name }}</p>
                            <label for="">Descripción:</label>
                            <p>{{ $vehicleroute->description }}</p>
                            <label for="">Zonas por donde pasa:</label>
                            @if ($zone_names->isNotEmpty())
                                @foreach ($zone_names as $zone)
                                    <p>{{ $zone->zone_name }}</p>
                                @endforeach
                            @else
                                <p>No hay zonas registradas para esta ruta.</p>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <div class="card">
                        <div class="card-body">
                            <table id="datatable" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>LATITUD</th>
                                        <th>LONGITUD</th>
                                        <th></th>
                                    </tr>

                                </thead>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="card-footer">
            <a href="{{ route('admin.vehicleroutes.index', ['route_id' => $vehicleroute->route_id]) }}" class="btn btn-danger float-right"><i class="fas fa-chevron-left"></i> Retornar</a>
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
            var table = $('#datatable').DataTable({
                "ajax": "{{ route('admin.vehicleroutes.show', $vehicleroute->vehicleroute_id) }}",
                "columns": [{
                        "data": "latitude",
                        "orderable": false,
                        "searchable": false,
                    },
                    {
                        "data": "longitude",
                        "orderable": false,
                        "searchable": false,
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

        $('#btnNuevo').click(function() {
            var id = $(this).attr('data-id');
            $.ajax({
                url: "{{ route('admin.routepaths.edit', '_id') }}".replace('_id', id),
                type: "GET",
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Agregar coordenada");
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
                                refreshTable();
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
                            refreshTable();
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

        function refreshTable() {
            var table = $('#datatable').DataTable();
            table.ajax.reload(null, false);
        }
    </script>
@endsection