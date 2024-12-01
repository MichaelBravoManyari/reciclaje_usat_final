{!! Form::hidden('route_id', $route_id) !!}

<div class="form-group">
    {!! Form::label('zone_id', 'Eliga la zona a agregar') !!}
    {!! Form::select('zone_id', $zones, null, ['class' => 'form-control', 'required']) !!}
</div>