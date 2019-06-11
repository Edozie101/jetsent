jQuery(function() {
  var completer;

  completer = new GmapsCompleter({
      mapElem: "#gmaps-canvas",
      zoomLevel: 5,
      mapType: google.maps.MapTypeId.ROADMAP,
      pos: [51.751724, -1.255284],
      inputField: '#trip_from',
      errorField: '#gmaps-error',
      debugOn: false
  });

  completer.autoCompleteInit({
    country: "United Kingdom"
  });
});
