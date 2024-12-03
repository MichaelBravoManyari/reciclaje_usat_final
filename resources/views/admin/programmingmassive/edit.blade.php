{!! Form::model($programming, ['route' => ['admin.programmingmassive.update', $programming], 'method' => 'put']) !!}

{{-- <p>Fecha de inicio de programación: {{ $programming->startdate }}</p>
{!! Form::hidden('programming', $programming->startdate) !!}

<p>Fecha final de programación:: {{ $programming->lastdate }}</p>
{!! Form::hidden('programming', $programming->lastdate) !!} --}}

@include('admin.programmingmassive.template.form')

<button type="submit" class="btn btn-success"><i class="fas fa-pen-square"></i> Actualizar</button>
<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-arrow-alt-circle-left"></i> Cerrar</button>
{!! Form::close() !!}
