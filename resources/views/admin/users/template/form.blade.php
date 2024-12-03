<div class="form-row">
    <div class="form-group col-4">
        {!! Form::label('dni', 'DNI') !!}
        {!! Form::text('dni', null, [
            'class' => 'form-control',
            'placeholder' => 'Ingrese el DNI',
            //'required',
        ]) !!}
    </div>
    <div class="form-group col-8">
        {!! Form::label('name', 'Nombre y Apellidos') !!}
        {!! Form::text('name', null, [
            'class' => 'form-control',
            'placeholder' => 'Ingrese nombres y apellidos',
            'required',
        ]) !!}
    </div>
</div>

<div class="form-row">
    <div class="form-group col-8">
        {!! Form::label('address', 'Dirección') !!}
        {!! Form::text('address', null, [
            'class' => 'form-control',
            'placeholder' => 'Ingrese la dirección',
            //'required',
        ]) !!}
    </div>
    <div class="form-group col-4">
        {!! Form::label('birthdate', 'Nacimiento') !!}
        {!! Form::date('birthdate', null, [
            'class' => 'form-control',
            'placeholder' => 'Fecha de nacimiento',
            //'required',
        ]) !!}
    </div>

</div>

<div class="form-row">
    <div class="form-group col-7">
        {!! Form::label('usertype_id', 'Tipo de personal') !!}
        {!! Form::select('usertype_id', $usertype, isset($user->usertype_id) ? $user->usertype_id : null, [
            'class' => 'form-control',
            'id' => 'usertype_id',
            'required',
            'onchange' => 'toggleLicenseField()',
        ]) !!}
    </div>
    <div class="form-group col-5">
        {!! Form::label('license', 'Licencia') !!}
        {!! Form::text('license', isset($user->license) ? $user->license : null, [
            'class' => 'form-control',
            'placeholder' => 'Ingrese la licencia',
            'id' => 'license',
            'disabled' => !isset($user) || $user->usertype_id != 2 ? true : false,
        ]) !!}
    </div>
</div>


<div class="form-row">
    <div class="form-group col-7">
        {!! Form::label('email', 'Correo electrónico') !!}
        {!! Form::email('email', null, [
            'class' => 'form-control',
            'placeholder' => 'Ingrese el correo electrónico',
            'required',
        ]) !!}
    </div>
    <div class="form-group col-5">
        {!! Form::label('password', 'Contraseña') !!}
        <div class="input-group">
            {!! Form::password('password', [
                'class' => 'form-control',
                'placeholder' => 'Contraseña',
                'id' => 'password',
            ]) !!}
            <div class="input-group-append">
                <button type="button" class="btn btn-outline-secondary" onclick="togglePasswordVisibility()">
                    <i id="togglePasswordIcon" class="fa fa-eye"></i>
                </button>
            </div>
        </div>
    </div>
</div>

<div class="form-row">
    <div class="form-group col-3">
        {!! Form::file('logo', [
            'class' => 'form-control-file d-none', // Oculta el input
            'accept' => 'image/*',
            'id' => 'imageInput',
        ]) !!}
        <button type="button" class="btn btn-primary" id="imageButton"><i class="fas fa-image"></i> Imagen</button>

    </div>
    <div class="form-group col-9">
        <img id="imagePreview" src="#" alt="Vista previa de la imagen"
            style="max-width: 100%; height: auto; display: none;">
    </div>
</div>

<script>
    function toggleLicenseField() {
        const userTypeSelect = document.getElementById('usertype_id');
        const licenseField = document.getElementById('license');

        const selectedUserType = userTypeSelect.value;

        if (selectedUserType == '2') {
            licenseField.disabled = false;
        } else {
            licenseField.disabled = true;
            licenseField.value = '';
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        toggleLicenseField();
    });

    function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");
        var togglePasswordIcon = document.getElementById("togglePasswordIcon");
        if (passwordField.type === "password") {
            passwordField.type = "text";
            togglePasswordIcon.classList.remove("fa-eye");
            togglePasswordIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            togglePasswordIcon.classList.remove("fa-eye-slash");
            togglePasswordIcon.classList.add("fa-eye");
        }
    }

    $('#imageInput').change(function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                $('#imagePreview').attr('src', e.target.result).show();
            };
            reader.readAsDataURL(file);
        }
    });

    $('#imageButton').click(function() {
        $('#imageInput').click();
    });
</script>
