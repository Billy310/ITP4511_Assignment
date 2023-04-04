<!DOCTYPE html>
<html>
<head>
  <title>Map Example</title>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKIm352enWiDL0qbvU5Cy2GABBiFkvVIk"></script>
  <script>
    function initMap() {
      var myLatLng = {lat: -25.363, lng: 131.044};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: myLatLng
      });
      var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: 'Hello World!'
      });
    }
  </script>
</head>
<body onload="initMap()">
  <div id="map" style="height: 500px;"></div>
</body>
</html>