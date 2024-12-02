<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('date_route', 'Fecha de ruta') !!}
        {!! Form::date('date_route', null, [
            'class' => 'form-control',
            'required',
            'disabled',
        ]) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('routestatus_id', 'Estado') !!}
        {!! Form::select('routestatus_id', $routestatus, null, [
            'class' => 'form-control',
            'id' => 'routestatus_id',
            'required',
        ]) !!}
    </div>
</div>
<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('time_route', 'Hora') !!}
        {!! Form::time('time_route', null, [
            'class' => 'form-control',
            'placeholder' => 'Hora',
            'required',
        ]) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('schedule_id', 'Horario') !!}
        {!! Form::select('schedule_id', $schedule, null, [
            'class' => 'form-control',
            'id' => 'schedule_id',
            'required',
        ]) !!}
    </div>
</div>

<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('vehicle_id', 'Vehículo') !!}
        {!! Form::select('vehicle_id', $vehicles, null, ['class' => 'form-control', 'id' => 'vehicle_id', 'required']) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('route_id', 'Ruta') !!}
        {!! Form::select('route_id', $routes, null, [
            'class' => 'form-control',
            'id' => 'route_id',
            'required',
            'disabled',
        ]) !!}
    </div>
</div>

<div class="form-row">
    <div class="form-group col-12">
        {!! Form::label('description', 'Descripción') !!}
        {!! Form::text('description', null, [
            'class' => 'form-control',
            'required',
        ]) !!}
    </div>
</div>
