var mapObject = function(accessToken, id) {
  this.id = id;
  this.accessToken = accessToken;
  this.iconUrl = 'images/marker-icon.png';
  this.iconAnchor = [20, 40];
  this.defaultLatLon = [41.413876, 2.172767];
  this.defaultZoom = 12;
  this.setInitalListeners();
}

mapObject.prototype.setInitalListeners = function() {
  var that = this;
  if ($('#map')) {
    that.processMap();
  }
}

mapObject.prototype.createDefaultIcon = function() {
  var myIcon = L.icon({
    iconUrl: this.iconUrl,
    iconAnchor: this.iconAnchor,
  });
  return myIcon;
}

mapObject.prototype.setDefaultView = function() {
  return L.map('map').setView(this.defaultLatLon, this.defaultZoom);
}

mapObject.prototype.displayMap = function(map) {
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: this.id,
    accessToken: this.accessToken,
  }).addTo(map);
}

mapObject.prototype.addMarkerToMap = function(obj, name, url, link) {
  obj.bindPopup(`<b>${name}</b><br><br><img src="http://s3.amazonaws.com/ownthespot/spots/logos/000/000/${url}"><br><br><a href="/spots/${link}">Go to the spot</a>`);
}

mapObject.prototype.processMap = function (accessToken, id) {
  var myIcon = this.createDefaultIcon();
  var map = this.setDefaultView();


  var macba = L.marker([41.382950, 2.167280], {icon: myIcon}).addTo(map);
  var placaUniversitat = L.marker([41.385727, 2.164016], {icon: myIcon}).addTo(map);
  var hotelVela = L.marker([41.368066, 2.190249], {icon: myIcon}).addTo(map);
  var macbaDownhill = L.marker([41.384521, 2.165832], {icon: myIcon}).addTo(map);
  var arcDeTriomf = L.marker([41.389483, 2.183147], {icon: myIcon}).addTo(map);
  var parcCiutadella = L.marker([41.386411, 2.186643], {icon: myIcon}).addTo(map);
  var montbauManualPad = L.marker([41.430239, 2.145480], {icon: myIcon}).addTo(map);
  var montbauDownhill = L.marker([41.432158, 2.148331], {icon: myIcon}).addTo(map);
  var hostafrancs = L.marker([41.376212, 2.142402], {icon: myIcon}).addTo(map);
  var barcelonetaBanks = L.marker([41.382308, 2.186439], {icon: myIcon}).addTo(map);
  var placaAnnaFrank = L.marker([41.402490, 2.154398], {icon: myIcon}).addTo(map);
  var fondoStairs = L.marker([41.454024, 2.222365], {icon: myIcon}).addTo(map);
  var canyelles = L.marker([41.443632, 2.171952], {icon: myIcon}).addTo(map);
  var forumFountain = L.marker([41.411157, 2.220802], {icon: myIcon}).addTo(map);
  var pobleNouRedCurb = L.marker([41.400337, 2.210062], {icon: myIcon}).addTo(map);
  var gloriesBumps = L.marker([41.403339, 2.189907], {icon: myIcon}).addTo(map);
  var marinaMicroSpot = L.marker([41.391600, 2.191466], {icon: myIcon}).addTo(map);
  var worldTradeCenter = L.marker([41.372649, 2.178741], {icon: myIcon}).addTo(map);
  var sants = L.marker([41.380283, 2.142049], {icon: myIcon}).addTo(map);
  var mercatDeLesFlors = L.marker([41.371534, 2.157448], {icon: myIcon}).addTo(map);

  this.addMarkerToMap(macba, "Macba", "249/square/macba.jpg", "macba" );
  this.addMarkerToMap(placaUniversitat, "Plaça Universitat", "248/square/uni.jpg", "placa-universitat" );
  this.addMarkerToMap(hotelVela, "Hotel Vela", "266/square/vela.jpg", "hotel-vela" );
  this.addMarkerToMap(macbaDownhill, "Macba downhill", "250/square/macba_downhill.png", "macba-downhill" );
  this.addMarkerToMap(arcDeTriomf, "Arc de Triomf", "252/square/arc.jpg", "arc-de-triomf" );
  this.addMarkerToMap(parcCiutadella, "Parc de la Ciutadella", "253/square/ciutadella.jpg", "parc-de-la-ciutadella" );
  this.addMarkerToMap(montbauManualPad, "Montbau manual pad", "254/square/montbau_manny.png", "montbau-manual-pad" );
  this.addMarkerToMap(montbauDownhill, "Montbau downhill", "255/square/montbau_downhill.jpg", "montbau-downhill" );
  this.addMarkerToMap(hostafrancs, "Hostafrancs", "256/square/hostafrancs.png", "hostafrancs" );
  this.addMarkerToMap(barcelonetaBanks, "Barceloneta banks", "257/square/barceloneta_banks.png", "barceloneta-banks" );
  this.addMarkerToMap(placaAnnaFrank, "Plaça d'Anna Frank", "258/square/anna_frank.jpg", "placa-d-anna-frank" );
  this.addMarkerToMap(fondoStairs, "Fondo stairs", "259/square/forum_stairs.jpg", "forum-stairs" );
  this.addMarkerToMap(canyelles, "Canyelles", "260/square/Vallcarca.jpg", "vallcarca-tennis-court-curbs" );
  this.addMarkerToMap(forumFountain, "Forum fountain", "261/square/fountain.jpg", "forum-fountain" );
  this.addMarkerToMap(pobleNouRedCurb, "Poble Nou low-to-high", "262/square/red_curb.jpg", "the-infamois-red-low-to-high-curb" );
  this.addMarkerToMap(gloriesBumps, "Gloriès bumps", "263/square/glories.jpg", "glories-bumps-and-curbs" );
  this.addMarkerToMap(marinaMicroSpot, "Marina mini spot", "264/square/marina.jpg", "marina-micro-spot" );
  this.addMarkerToMap(worldTradeCenter, "World Trade Center", "265/square/wtc.png?1438730516", "world-trade-center" );
  this.addMarkerToMap(sants, "Estació de Sants", "267/square/sants.jpg", "estacio-de-sants" );
  this.addMarkerToMap(mercatDeLesFlors, "Mercat de les Flors", "251/square/mercat.jpg", "mercat-de-las-flors" );

  this.displayMap(map, id, accessToken);
};
