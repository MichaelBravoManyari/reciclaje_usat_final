{!! Form::hidden('type', $type) !!}
{!! Form::hidden('route_id', $route_id) !!}

<div class="form-row">
    <div class="form-group col-6">
        {!! Form::label('latitude', 'Latitud') !!}
        {!! Form::text('latitude', null, [
            'class' => 'form-control',
            'placeholder' => 'Latitud',
            'required',
            'readonly',
        ]) !!}
    </div>
    <div class="form-group col-6">
        {!! Form::label('longitude', 'Longitud') !!}
        {!! Form::text('longitude', null, [
            'class' => 'form-control',
            'placeholder' => 'Longitud',
            'required',
            'readonly',
        ]) !!}
    </div>
</div>
<div id="map" class="card" style="width: 100%; height:400px;"></div>
<script>

    var latInput = document.getElementById('latitude');
    var lonInput = document.getElementById('longitude');

    function initMap() {

        var lat = {{ $latitude }};
        var lng = {{ $longitude }};

        if (isNaN(lat) || isNaN(lng) || lat === 0 || lng === 0) {
            navigator.geolocation.getCurrentPosition(function(position) {
                lat = position.coords.latitude;
                lng = position.coords.longitude;
                displayMap(lat, lng);
            });
        } else {
            displayMap(lat, lng);
        }
    }

    function displayMap(lat, lng) {
        var type = '{{ $type }}';

        var mapOptions = {
            center: {
                lat: lat,
                lng: lng
            },
            zoom: 18
        };

        var map = new google.maps.Map(document.getElementById('map'), mapOptions);

        if (type === 'start_coord') {
            var marker_first_coord = new google.maps.Marker({
                position: {
                    lat: lat,
                    lng: lng + 0.001
                },
                map: map,
                draggable: true,
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    fillColor: 'green',
                    fillOpacity: 1,
                    strokeColor: 'green',
                    strokeWeight: 2,
                    scale: 10
                }
            });

            var marker_second_coord = new google.maps.Marker({
                position: {
                    lat: lat,
                    lng: lng
                },
                map: map,
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    fillColor: 'red',
                    fillOpacity: 1,
                    strokeColor: 'red',
                    strokeWeight: 2,
                    scale: 10
                }
            });

            var infoWindowFirstMarker = new google.maps.InfoWindow({
                content: `<div><strong>Coordenada de inicio</strong></div>`
            });

            var infoWindowSecondMarker = new google.maps.InfoWindow({
                content: `<div><strong>Coordenada de fin</strong></div>`
            });

            marker_first_coord.addListener('click', function() {
                infoWindowFirstMarker.open(map, marker_first_coord);
            });

            marker_second_coord.addListener('click', function() {
                infoWindowSecondMarker.open(map, marker_second_coord);
            });

            google.maps.event.addListener(marker_first_coord, 'dragend', function(event) {
                var latLng = event.latLng;
                latInput.value = latLng.lat();
                lonInput.value = latLng.lng();
            });
        } else {
            var marker_first_coord = new google.maps.Marker({
                position: {
                    lat: lat,
                    lng: lng + 0.001
                },
                map: map,
                draggable: true,
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    fillColor: 'red',
                    fillOpacity: 1,
                    strokeColor: 'red',
                    strokeWeight: 2,
                    scale: 10
                }
            });

            var marker_second_coord = new google.maps.Marker({
                position: {
                    lat: lat,
                    lng: lng
                },
                map: map,
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    fillColor: 'green',
                    fillOpacity: 1,
                    strokeColor: 'green',
                    strokeWeight: 2,
                    scale: 10
                }
            });

            var infoWindowFirstMarker = new google.maps.InfoWindow({
                content: `<div><strong>Coordenada de fin</strong></div>`
            });

            var infoWindowSecondMarker = new google.maps.InfoWindow({
                content: `<div><strong>Coordenada de inicio</strong></div>`
            });

            marker_first_coord.addListener('click', function() {
                infoWindowFirstMarker.open(map, marker_first_coord);
            });

            marker_second_coord.addListener('click', function() {
                infoWindowSecondMarker.open(map, marker_second_coord);
            });

            google.maps.event.addListener(marker_first_coord, 'dragend', function(event) {
                var latLng = event.latLng;
                latInput.value = latLng.lat();
                lonInput.value = latLng.lng();
            });
        }
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&callback=initMap" async defer>
</script>
