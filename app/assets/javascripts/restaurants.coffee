$ ->
  drawMap = (address) ->
    handler = Gmaps.build('Google')
    geocoder = new google.maps.Geocoder()
    geocoder.geocode(
      {
        'address': address
        'region': 'jp'
      }
      (results, status) ->
        if (status == google.maps.GeocoderStatus.OK)
          handler.buildMap({ provider: {scrollwheel: false}, internal: {id: 'map'}}, () ->
            markers = handler.addMarkers([
              "lat": results[0].geometry.location.lat()
              "lng": results[0].geometry.location.lng()
            ])
            handler.bounds.extendWith(markers)
            handler.fitMapToBounds()
            handler.getMap().setZoom(17)
          )
      )
  drawMap($('#address').text())
