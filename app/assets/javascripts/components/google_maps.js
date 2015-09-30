function initMap() {
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
    zoom: 12,
    center: {lat: 53.7781216, lng: -0.3573658}
  });
  var geocoder = new google.maps.Geocoder();

  google.maps.event.addListenerOnce(map, 'idle', function(){
    geocodeAddress(geocoder, map);
  });
}

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').innerHTML;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    }
  });
}
