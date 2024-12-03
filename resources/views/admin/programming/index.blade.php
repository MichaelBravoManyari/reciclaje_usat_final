@extends('adminlte::page')

@section('title', 'Programación')

@section('content')
    <div class="p-2"></div>
    <div class="card">
        <div class="card-header">
            <h4>Programaciones</h4>
        </div>

        <div class="card-body table-responsive">
            <form action="{{ route('admin.programming.store') }}" method="POST" class="frmprogramming">
                @csrf
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th>VEHÍCULO</th>
                            <th>RUTA</th>
                            <th>FECHA DE INICIO</th>
                            <th>FECHA DE FIN</th>
                            <th>HORA</th>
                            <th>HORARIO</th>
                            <th>BUSCAR</th>
                            <th>PROGRAMAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                {!! Form::select('vehicle_id', $vehicles, null, ['id' => 'vehicle_id', 'class' => 'form-control', 'required']) !!}
                            </td>
                            <td>
                                {!! Form::select('route_id', $routes, null, ['id' => 'route_id', 'class' => 'form-control', 'required']) !!}
                            </td>
                            <td>
                                <input type="date" name="startdate" id="startdate" class="form-control"
                                    value="{{ $startdate }}" required>
                            </td>
                            <td>
                                <input type="date" name="lastdate" id="lastdate" class="form-control"
                                    value="{{ $lastdate }}" required>
                            </td>
                            <td>
                                <input type="time" name="time_route" id="time_route" value="{{ $time_route }}"
                                    class="form-control" required>
                            </td>
                            <td>
                                {!! Form::select('schedule_id', $schedules, null, [
                                    'id' => 'schedule_id',
                                    'class' => 'form-control',
                                    'required',
                                ]) !!}
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Buscar">
                                    <button type="button" class="btn btn-success btn-sm" onclick="search()"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Programación">
                                    <button class="btn btn-primary btn-sm" id="btnNuevo">
                                        <i class="fas fa-calendar-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-warning btn-sm" id="WeekdaysProgramming">
                                        <i class="fas fa-calendar-week" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-info btn-sm" id="InterleavedProgramming">
                                        <i class="fas fa-random" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div id="listado"></div>
        </div>
    </div>

    <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Editar programación</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="formModalMass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Editar programación masiva</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
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
        $(".frmprogramming").submit(function(e) {
            e.preventDefault();

            Swal.fire({
                title: "¿Estás seguro de programar la ruta?",
                text: "Esta acción es irreversible!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, programar!"
            }).then((result) => {
                if (result.isConfirmed) {
                    var form = $(this);
                    $.ajax({
                        url: form.attr('action'),
                        type: form.attr('method'),
                        data: form.serialize(),
                        success: function(response) {
                            Swal.fire('Proceso exitoso', response.message, 'success');
                            form[0].reset();
                        },
                        error: function(xhr) {
                            var response = xhr.responseJSON;
                            Swal.fire('Error', response.message, 'error');
                            form[0].reset();
                        }
                    });
                }
            });
        });

        function search() {
            $.ajax({
                url: '{{ route('admin.searchprogramming') }}',
                type: 'GET',
                data: {
                    vehicle_id: $("#vehicle_id").val(),
                    route_id: $("#route_id").val(),
                    startdate: $("#startdate").val(),
                    lastdate: $("#lastdate").val()
                },
                success: function(response) {
                    Swal.fire({
                        title: 'Cargando...',
                        text: 'Obteniendo programación, por favor espere.',
                        allowOutsideClick: false,
                        didOpen: () => {
                            Swal.showLoading();
                        }
                    });
                    setTimeout(function() {
                        Swal.close();

                        const table_content = response;
                        $("#listado").html(table_content);
                    }, 800);
                },
                error: function(xhr, status, error) {
                    var response = xhr.responseJSON;
                    Swal.fire('Error', response.message, 'error');
                }
            });
        }

        $('#WeekdaysProgramming').click(function(e) {
            e.preventDefault();

            var form = $(".frmprogramming");
            var startdate = form.find('#startdate').val();
            var lastdate = form.find('#lastdate').val();
            var vehicle_id = form.find('#vehicle_id').val();
            var route_id = form.find('#route_id').val();
            var schedule_id = form.find('#schedule_id').val();
            var time_route = form.find('#time_route').val();

            $.ajax({
                url: "{{ route('admin.programming.storeWeekdays') }}",
                type: "POST",
                data: {
                    startdate: startdate,
                    lastdate: lastdate,
                    vehicle_id: vehicle_id,
                    route_id: route_id,
                    schedule_id: schedule_id,
                    time_route: time_route,
                    _token: "{{ csrf_token() }}"
                },
                success: function(response) {
                    Swal.fire({
                        title: "¿Estás seguro de programar la ruta sin tomar en cuenta fines de semana?",
                        text: "Esta acción es irreversible, se excluirán los fines de semana.",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Sí, programar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire('Proceso exitoso', response.message, 'success');
                            form[0].reset();
                        }
                    });
                },
                error: function(xhr) {
                    var response = xhr.responseJSON;
                    Swal.fire('Error', response.message, 'error');
                    form[0].reset();
                }
            });
        });

        $('#InterleavedProgramming').click(function(e) {
            e.preventDefault();

            var form = $(".frmprogramming");
            var startdate = form.find('#startdate').val();
            var lastdate = form.find('#lastdate').val();
            var vehicle_id = form.find('#vehicle_id').val();
            var route_id = form.find('#route_id').val();
            var schedule_id = form.find('#schedule_id').val();
            var time_route = form.find('#time_route').val();

            $.ajax({
                url: "{{ route('admin.programming.storeInterleaved') }}",
                type: "POST",
                data: {
                    startdate: startdate,
                    lastdate: lastdate,
                    vehicle_id: vehicle_id,
                    route_id: route_id,
                    schedule_id: schedule_id,
                    time_route: time_route,
                    _token: "{{ csrf_token() }}"
                },
                success: function(response) {
                    Swal.fire({
                        title: "¿Estás seguro de programar la ruta intercalada?",
                        text: "Esta acción es irreversible, se excluirán algunos días.",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Sí, programar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire('Proceso exitoso', response.message, 'success');
                            form[0].reset();
                        }
                    });
                },
                error: function(xhr) {
                    var response = xhr.responseJSON;
                    Swal.fire('Error', response.message, 'error');
                    form[0].reset();
                }
            });
        });
    </script>
@stop
