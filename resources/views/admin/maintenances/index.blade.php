@extends('adminlte::page')

@section('title', 'ReciclaUSAT')

{{-- @section('content_header')
  <h1>Horarios</h1>
@stop --}}

@section('content')
    <div class="p-2"></div>
    <div class="card">
        <div class="card-header">
            <button class="btn btn-success float-right" id="btnNuevo"><i class="fas fa-plus"></i> Nuevo</button>
            <h3>Mantenimientos</h3>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-striped" id="datatable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>FECHA INICIO</th>
                        <th>FECHA FINAL</th>
                        <th>HORARIO</th>
                        <th width="10"></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Formulario del mantenimiento</h5>
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
    {{-- Add here extra stylesheets --}}
    {{-- <link rel="stylesheet" href="/css/admin_custom.css"> --}}
@stop
@section('js')
    <script>
        $(document).ready(function() {
            var table = $('#datatable').DataTable({
                "ajax": "{{ route('admin.maintenances.index') }}", // La ruta que llama al controlador vía AJAX
                "columns": [{
                        "data": "id",
                    },
                    {
                        "data": "name",
                    },
                    {
                        "data": "startdate",
                    },
                    {
                        "data": "lastdate",
                    },
                    {
                        "data": "schedules",
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

            $.ajax({
                url: "{{ route('admin.maintenances.create') }}",
                type: "GET",
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Nuevo mantenimiento");
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

        $(document).on('click', '.btnEditar', function() {
            var id = $(this).attr("id");

            $.ajax({
                url: "{{ route('admin.maintenances.edit', 'id') }}".replace('id', id),
                type: "GET",
                success: function(response) {
                    $("#formModal #exampleModalLabel").html("Modificar Mantenimiento");
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
        })

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

        $(document).on('click', '.btnSchedules', function(e) {
            e.preventDefault();
            var id = $(this).data('id');

            if (!id) {
                Swal.fire('Error', 'No se pudo obtener el ID del mantenimiento.', 'error');
                return;
            }
            var url = "{{ route('admin.maintenances.show', 'id') }}".replace('id', id);

            $.ajax({
                url: url,
                type: "GET",
                success: function(response) {
                    window.location.href = url;
                },
                error: function(xhr) {
                    var response = xhr.responseJSON;
                    Swal.fire('Error', response.message, 'error');
                }
            });
        });

        function refreshTable() {
            var table = $('#datatable').DataTable();
            table.ajax.reload(null, false); // Recargar datos sin perder la paginación
        }
    </script>

@endsection