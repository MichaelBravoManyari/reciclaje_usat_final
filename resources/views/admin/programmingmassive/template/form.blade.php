<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('routestatus_id', 'Estado') !!}
        {!! Form::select('routestatus_id', $routestatus, $routestatus_id, [
            'class' => 'form-control',
            'id' => 'routestatus_id',
            'required',
        ]) !!}
    </div>
</div>

<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('time_route', 'Hora') !!}
        {!! Form::time('time_route', $time_route, [
            'class' => 'form-control',
            'placeholder' => 'Hora',
            'required',
        ]) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('schedule_id', 'Horario') !!}
        {!! Form::select('schedule_id', $schedule, $schedule_id, [
            'class' => 'form-control',
            'id' => 'schedule_id',
            'required',
        ]) !!}
    </div>

</div>

<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('vehicle_id', 'Vehículo') !!}
        {!! Form::select('vehicle_id', $vehicles, $vehicle_id, [
            'class' => 'form-control',
            'id' => 'vehicle_id',
            'required',
        ]) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('route_id', 'Ruta') !!}
        {!! Form::select('route_id', $routes, $route_id, [
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
        ]) !!}
    </div>
</div>

