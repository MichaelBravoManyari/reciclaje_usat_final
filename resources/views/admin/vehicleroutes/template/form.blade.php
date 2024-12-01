{!! Form::hidden('route_id', $route_id) !!}

<div class="form-group">
    {!! Form::label('vehicle_id', 'Vehiculo') !!}
    {!! Form::select('vehicle_id', $vehicles, null, ['class' => 'form-control', 'required']) !!}
</div>

<div class="form-group">
    {!! Form::label('schedule_id', 'Horario') !!}
    {!! Form::select('schedule_id', $schedules, null, ['class' => 'form-control', 'required']) !!}
</div>

<div class="form-group">
    {!! Form::label('date_route', 'Fecha') !!}
    {!! Form::date('date_route', null, [
        'class' => 'form-control',
        'placeholder' => 'Fecha',
        'required',
    ]) !!}
</div>

<div class="form-group">
    {!! Form::label('time_route', 'Hora') !!}
    {!! Form::time('time_route', null, [
        'class' => 'form-control',
        'placeholder' => 'Hora',
        'required',
    ]) !!}
</div>

<div class="form-group">
    {!! Form::label('description', 'Descripción') !!}
    {!! Form::textarea('description', null, [
        'class' => 'form-control',
        'placeholder' => 'Descripción del vehiculo en la ruta',
    ]) !!}
</div>