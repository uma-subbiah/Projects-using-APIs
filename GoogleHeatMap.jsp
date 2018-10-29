<!-- Inputs from https://developers.google.com/maps/documentation/javascript/examples/layer-heatmap -->
<!-- Monsoon rain data from https://www.kaggle.com/rajanand/rainfall-in-india-->
<!-- Geocoding facilities from https://csv2geo.com/site/index-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Heatmaps</title>
        <style>
            /*
            Basic CSS to design the page layout:
            */
            #map {
                height: 100%;
            }
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #floating-panel {
                position: absolute;
                top: 10px;
                left: 25%;
                z-index: 5;
                background-color: #fff;
                padding: 5px;
                border: 1px solid #999;
                text-align: center;
                font-family: 'Roboto','sans-serif';
                line-height: 30px;
                padding-left: 10px;
            }
            #floating-panel {
                background-color: #fff;
                border: 1px solid #999;
                left: 25%;
                padding: 5px;
                position: absolute;
                top: 10px;
                z-index: 5;
            }
        </style>
    </head>

    <body>
        <div id="floating-panel">
            <button onclick="toggleHeatmap()">Toggle Heatmap</button>
            <button onclick="changeGradient()">Change gradient</button>
            <button onclick="changeRadius()">Change radius</button>
            <button onclick="changeOpacity()">Change opacity</button>
        </div>
        <div id="map"></div>
        <script>
            var map, heatmap;

            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 4,
                    center: {lat: 27.616935, lng: 93.839156},
                    mapTypeId: 'satellite'
                });

                heatmap = new google.maps.visualization.HeatmapLayer({
                    data: getPoints(),
                    map: map
                });
            }

            function toggleHeatmap() {
                heatmap.setMap(heatmap.getMap() ? null : map);
            }

            function changeGradient() {
                var gradient = [
                    'rgba(0, 255, 255, 0)',
                    'rgba(0, 255, 255, 1)',
                    'rgba(0, 191, 255, 1)',
                    'rgba(0, 127, 255, 1)',
                    'rgba(0, 63, 255, 1)',
                    'rgba(0, 0, 255, 1)',
                    'rgba(0, 0, 223, 1)',
                    'rgba(0, 0, 191, 1)',
                    'rgba(0, 0, 159, 1)',
                    'rgba(0, 0, 127, 1)',
                    'rgba(63, 0, 91, 1)',
                    'rgba(127, 0, 63, 1)',
                    'rgba(191, 0, 31, 1)',
                    'rgba(255, 0, 0, 1)'
                ]
                heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
            }

            function changeRadius() {
                heatmap.set('radius', heatmap.get('radius') ? 25 : 30);
            }

            function changeOpacity() {
                heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
            }

            function getPoints() {
                return [
                    new google.maps.LatLng(12.916517, 79.132499),
                    new google.maps.LatLng(11.016845, 76.955832
                            ),
                    new google.maps.LatLng(12.106527, 78.136141
                            ),
                    new google.maps.LatLng(8.088306, 77.538451
                            ),
                    new google.maps.LatLng(13.08268, 80.270718
                            ),
                    new google.maps.LatLng(9.925201, 78.119775
                            ),
                    new google.maps.LatLng(11.491604, 76.733652
                            ),
                    new google.maps.LatLng(12.616553, 76.084151
                            ),
                    new google.maps.LatLng(11.51954, 77.896716
                            ),
                    new google.maps.LatLng(10.786999, 79.137827
                            ),
                    new google.maps.LatLng(10.790483, 78.704673
                            ),
                    new google.maps.LatLng(8.713913, 77.756652
                            ),
                    new google.maps.LatLng(11.341036, 77.717164
                            ),
                    new google.maps.LatLng(10.379663, 78.820845
                            ),
                    new google.maps.LatLng(10.367312, 77.980291
                            ),
                    new google.maps.LatLng(9.568012, 77.962444
                            ),
                    new google.maps.LatLng(9.8433, 78.480878
                            ),
                    new google.maps.LatLng(8.764166, 78.134836
                            ),
                    new google.maps.LatLng(12.225284, 79.074696
                            ),
                    new google.maps.LatLng(10.765608, 79.842389
                            ),
                    new google.maps.LatLng(11.93689, 79.487262
                            ),
                    new google.maps.LatLng(11.748042, 79.771369
                            ),
                    new google.maps.LatLng(12.834174, 79.70364
                            ),
                    new google.maps.LatLng(13.254434, 80.008775
                            ),
                    new google.maps.LatLng(10.010366, 77.476811
                            ),
                    new google.maps.LatLng(11.219439, 78.167724
                            ),
                    new google.maps.LatLng(10.960078, 78.076604
                            ),
                    new google.maps.LatLng(11.240984, 78.866573
                            ),
                    new google.maps.LatLng(10.771319, 79.636997
                            ),
                    new google.maps.LatLng(12.518611, 78.213736
                            ),
                    new google.maps.LatLng(11.140059, 79.078628
                            ),
                    new google.maps.LatLng(11.108524, 77.341066
                            ),
                    new google.maps.LatLng(11.941592, 79.808313
                            ),
                    new google.maps.LatLng(10.92544, 79.838006
                            ),
                    new google.maps.LatLng(11.987, 79.97
                            ),
                    new google.maps.LatLng(16.727191, 82.217578
                            ),
                    new google.maps.LatLng(14.793707, 74.686882
                            ),
                    new google.maps.LatLng(12.843781, 75.247906
                            ),
                    new google.maps.LatLng(13.340881, 74.742143
                            ),
                    new google.maps.LatLng(15.849695, 74.497674
                            ),
                    new google.maps.LatLng(17.91488, 77.50461
                            ),
                    new google.maps.LatLng(16.830171, 75.710031
                            ),
                    new google.maps.LatLng(15.458924, 75.007808
                            ),
                    new google.maps.LatLng(17.329731, 76.834296
                            ),
                    new google.maps.LatLng(16.760196, 77.142764
                            ),
                    new google.maps.LatLng(16.212003, 77.343928
                            ),
                    new google.maps.LatLng(16.172535, 75.655721
                            ),
                    new google.maps.LatLng(15.402633, 75.620809
                            ),
                    new google.maps.LatLng(14.795903, 75.397125
                            ),
                    new google.maps.LatLng(15.621895, 76.178374
                            ),
                    new google.maps.LatLng(13.284699, 77.607786
                            ),
                    new google.maps.LatLng(15.139393, 76.921443
                            ),
                    new google.maps.LatLng(13.315258, 75.775402
                            ),
                    new google.maps.LatLng(14.230559, 76.398454
                            ),
                    new google.maps.LatLng(12.337494, 75.806908
                            ),
                    new google.maps.LatLng(13.075258, 76.178374
                            ),
                    new google.maps.LatLng(13.42, 76.34
                            ),
                    new google.maps.LatLng(12.522157, 76.900919
                            ),
                    new google.maps.LatLng(12.29581, 76.639381
                            ),
                    new google.maps.LatLng(13.92993, 75.568101
                            ),
                    new google.maps.LatLng(13.339168, 77.113998
                            ),
                    new google.maps.LatLng(12.971599, 77.594563
                            ),
                    new google.maps.LatLng(11.926147, 76.943731
                            ),
                    new google.maps.LatLng(14.464409, 75.921758
                            ),
                    new google.maps.LatLng(14.567, 76.766
                            ),
                    new google.maps.LatLng(13.432366, 77.72804
                            ),
                    new google.maps.LatLng(9.498067, 76.338848
                            ),
                    new google.maps.LatLng(11.874478, 75.370366
                            ),
                    new google.maps.LatLng(9.981636, 76.299884
                            ),
                    new google.maps.LatLng(9.591567, 76.522153
                            ),
                    new google.maps.LatLng(11.258753, 75.78041
                            ),
                    new google.maps.LatLng(11.050976, 76.071097
                            ),
                    new google.maps.LatLng(10.78673, 76.654793
                            ),
                    new google.maps.LatLng(8.893212, 76.61414
                            ),
                    new google.maps.LatLng(10.527642, 76.214435
                            ),
                    new google.maps.LatLng(8.524139, 76.936638
                            ),
                    new google.maps.LatLng(9.918897, 77.10249
                            ),
                    new google.maps.LatLng(12.510224, 74.985168
                            ),
                    new google.maps.LatLng(9.264758, 76.787041
                            ),
                    new google.maps.LatLng(11.685358, 76.131995)
                ];
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBroxMMROpQd4a78Kals_6MVceshdKHfEc&libraries=visualization&callback=initMap">
        </script>
    </body>
</html>
