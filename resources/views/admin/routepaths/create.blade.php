{!! Form::open(['route' => 'admin.routepaths.store']) !!}
@include('admin.routepaths.template.form')
<button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Agregar</button>
<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-arrow-alt-circle-left"></i> Cerrar</button>

{!! Form::close() !!}