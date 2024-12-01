<div class="form-group">
    {!! Form::label('name', 'Nombre') !!}
    {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Nombre de la ruta', 'required']) !!}
</div>
<div class="form-group">
    {!! Form::label('status', 'Estado') !!}
    {!! Form::select('status', [1 => 'Activo', 0 => 'No Activo'], null, ['class' => 'form-control', 'required']) !!}
</div>