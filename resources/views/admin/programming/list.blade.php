<table class="table table-striped" id="datatable">
    <thead>
        <tr>
            <th>FECHA</th>
            <th>VEHICULO</th>
            <th>RUTA</th>
            <th>HORA</th>
            <th>HORARIO</th>
            <th>ESTADO</th>
            <th>DESCRIPCIÓN</th>
            <th width=10></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($programminglists as $programminglist)
            <tr>
                <td>{{ $programminglist->date_route }}</td>
                <td>{{ $programminglist->vehicle }}</td>
                <td>{{ $programminglist->route }}</td>
                <td>{{ $programminglist->time_route }}</td>
                <td>{{ $programminglist->sname }}</td>
                <td>{{ $programminglist->status }}</td>
                <td>{{ $programminglist->description }}</td>
                <td>
                    <?php if ($programminglist->status == 'Iniciado') : ?>
                    <button class="btnEditar btn btn-primary btn-sm" id="{{ $programminglist->id }}"><i
                            class="fa fa-edit"></i></button>
                    <?php endif; ?>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

<script>
    $('#datatable').DataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        }
    });

    $(".btnEditar").click(function() {
        var id = $(this).attr('id');
        $.ajax({
            url: "{{ route('admin.programming.edit', '_id') }}".replace('_id', id),
            type: "GET",
            success: function(response) {
                $('#formModal .modal-body').html(response);
                $('#formModal').modal('show');
            },
            error: function(xhr) {
                var response = xhr.responseJSON;
                Swal.fire('Error', response.message, 'error');
            }
        });
    });


    $(document).on('submit', '#formModal form', function(e) {
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
                Swal.fire('Proceso exitoso', response.message, 'success').then(() => {
                    location.reload();
                });
            },
            error: function(xhr) {
                var response = xhr.responseJSON;
                Swal.fire('Error', response.message, 'error');
            }
        });
    });
</script>
