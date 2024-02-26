document.addEventListener('DOMContentLoaded', function() {
    var map = L.map('map').setView([51.505, -0.09], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var polygonButton = document.getElementById('polygonButton');
    var points = [];
    var markers = [];

    // Function to add a point and create a marker
    function addPoint(latlng) {
        var marker = L.marker(latlng).addTo(map);
        markers.push(marker);
        points.push(latlng);
        if (points.length === 4) {
            // Remove existing markers
            markers.forEach(function(marker) {
                map.removeLayer(marker);
            });
            markers = [];
            // Draw polygon
            L.polygon(points).addTo(map);
            // Reset points
            points = [];
        }
    }

    polygonButton.addEventListener('click', function() {
        map.on('click', function(e) {
            addPoint(e.latlng);
        });
    });
});
