@extends('layouts.app')

@section('content')
    <div class="container">
        <h3>Edición Masiva de Programaciones</h3>

        {!! Form::open(['route' => 'admin.programming.massUpdate', 'method' => 'put', 'id' => 'massEditForm']) !!}
        <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edición Masiva de Programaciones</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        @foreach ($programminglists as $programminglist)
                            <div class="form-row">
                                <div class="form-group col-6">
                                    {!! Form::label("routestatus_id_{$programminglist->id}", 'Estado') !!}
                                    {!! Form::select('routestatus_id', $routestatus, null, [
                                        'class' => 'form-control',
                                        'id' => 'routestatus_id',
                                        'required',
                                    ]) !!}

    
                                </div>
                            </div>
                            <!-- Agregar más campos similares para cada programación -->
                        @endforeach
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Actualizar</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-window-close"></i>
                        Cancelar</button>
                </div>
            </div>
        </div>
        {!! Form::close() !!}
    </div>
@endsection
