<div id="map" class="card" style="width: 100%; height:400px;"></div>
<script>
    function initMap() {
        var routeLatitudeStart = {{ $routecoords->latitud_start }};
        var routeLongitudeStart = {{ $routecoords->longitude_start }};

        var routeLatitudeEnd = {{ $routecoords->latitude_end }};
        var routeLongitudeEnd = {{ $routecoords->longitude_end }};

        var mapOptions = {
            center: {
                lat: routeLatitudeStart,
                lng: routeLongitudeStart
            },
            zoom: 18
        };

        var map = new google.maps.Map(document.getElementById('map'), mapOptions);

        var zones = @json($zone_coords);
        var routePaths = @json($route_paths);

        var zonePolygons = {};
        zones.forEach(function (coord) {
            if (!zonePolygons[coord.zone_id]) {
                zonePolygons[coord.zone_id] = { name: coord.zone_name, coords: [] };
            }
            zonePolygons[coord.zone_id].coords.push({ lat: parseFloat(coord.lat), lng: parseFloat(coord.lng) });
        });

        var pathCoordinates = [
            { lat: routeLatitudeStart, lng: routeLongitudeStart },
            ...routePaths.map(function(path) {
                return { lat: path.lat, lng: path.lng };
            }),
            { lat: routeLatitudeEnd, lng: routeLongitudeEnd }
        ];

        Object.keys(zonePolygons).forEach(function (zoneId) {
            var polygon = new google.maps.Polygon({
                paths: zonePolygons[zoneId].coords,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35
            });

            polygon.setMap(map);

            var infowindow = new google.maps.InfoWindow({
                content: `<p>${zonePolygons[zoneId].name}</p>`,
            });

            polygon.addListener('click', function (event) {
                infowindow.setPosition(event.latLng);
                infowindow.open(map);
            });
        });

        var routePathPolyline = new google.maps.Polyline({
            path: pathCoordinates,
            geodesic: true,
            strokeColor: '#0000FF',
            strokeOpacity: 1.0,
            strokeWeight: 4
        });

        routePathPolyline.setMap(map);

        var markerRouteStartCoord = new google.maps.Marker({
            position: {
                lat: routeLatitudeStart,
                lng: routeLongitudeStart
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

        var markerRouteEndCoord = new google.maps.Marker({
            position: {
                lat: routeLatitudeEnd,
                lng: routeLongitudeEnd
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
            content: `<div><strong>Inicio de la ruta</strong></div>`
        });

        var infoWindowSecondMarker = new google.maps.InfoWindow({
            content: `<div><strong>Fin de la ruta</strong></div>`
        });

        markerRouteStartCoord.addListener('click', function() {
            infoWindowFirstMarker.open(map, markerRouteStartCoord);
        });

        markerRouteEndCoord.addListener('click', function() {
            infoWindowSecondMarker.open(map, markerRouteEndCoord);
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key={{ env('GOOGLE_MAPS_API_KEY') }}&callback=initMap" async defer>
</script>