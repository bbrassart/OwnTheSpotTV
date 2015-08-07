// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//=require leaflet-src
//= require turbolinks
//= require_tree .



$(document).ready(function() {

  var myIcon = L.icon.Default;

  var map = L.map('map').setView([41.413876, 2.172767], 12);

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


  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: 'bbrassart.b9fba4af',
      accessToken: 'pk.eyJ1IjoiYmJyYXNzYXJ0IiwiYSI6IjU2MTZjMjRmMjE2MmE4M2Q0OWEwMDVkYTc5YzM3M2Y3In0.V44T7lzZarK4_QwAwoEClw'
  }).addTo(map);

macba.bindPopup("<b>Macba</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/249/square/macba.jpg'><br><br><a href='/spots/macba'>Go to the spot</a>");
placaUniversitat.bindPopup("<b>Plaça Universitat</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/248/square/uni.jpg'><br><br><a href='/spots/placa-universitat'>Go to the spot</a>");
hotelVela.bindPopup("<b>Hotel Vela</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/266/square/vela.jpg'><br><br><a href='/spots/hotel-vela'>Go to the spot</a>");
macbaDownhill.bindPopup("<b>Macba downhill</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/250/square/macba_downhill.png'><br><br><a href='/spots/macba-downhill'>Go to the spot</a>");
arcDeTriomf.bindPopup("<b>Arc de Triomf</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/252/square/arc.jpg'><br><br><a href='/spots/arc-de-triomf'>Go to the spot</a>");
parcCiutadella.bindPopup("<b>Parc de la Ciutadella</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/253/square/ciutadella.jpg'><br><br><a href='/spots/parc-de-la-ciutadella'>Go to the spot</a>");
montbauManualPad.bindPopup("<b>Montbau manual pad</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/254/square/montbau_manny.png'><br><br><a href='/spots/montbau-manual-pad'>Go to the spot</a>");
montbauDownhill.bindPopup("<b>Montbau downhill</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/255/square/montbau_downhill.jpg'><br><br><a href='/spots/montbau-downhill'>Go to the spot</a>");
hostafrancs.bindPopup("<b>Hostafrancs</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/256/square/hostafrancs.png'><br><br><a href='/spots/hostafrancs'>Go to the spot</a>");
barcelonetaBanks.bindPopup("<b>Barceloneta banks</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/257/square/barceloneta_banks.png'><br><br><a href='/spots/barceloneta-banks'>Go to the spot</a>");
placaAnnaFrank.bindPopup("<b>Plaça d'Anna Frank</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/258/square/anna_frank.jpg'><br><br><a href='/spots/placa-d-anna-frank'>Go to the spot</a>");
fondoStairs.bindPopup("<b>Fondo stairs</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/259/square/forum_stairs.jpg'><br><br><a href='/spots/forum-stairs'>Go to the spot</a>");
canyelles.bindPopup("<b>Canyelles</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/260/square/Vallcarca.jpg'><br><br><a href='/spots/vallcarca-tennis-court-curbs'>Go to the spot</a>");
forumFountain.bindPopup("<b>Forum fountain</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/261/square/fountain.jpg'><br><br><a href='/spots/forum-fountain'>Go to the spot</a>");
pobleNouRedCurb.bindPopup("<b>Poble Nou low-to-high</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/262/square/red_curb.jpg'><br><br><a href='/spots/the-infamois-red-low-to-high-curb'>Go to the spot</a>");
gloriesBumps.bindPopup("<b>Gloriès bumps</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/263/square/glories.jpg'><br><br><a href='/spots/glories-bumps-and-curbs'>Go to the spot</a>");
marinaMicroSpot.bindPopup("<b>Marina mini spot</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/264/square/marina.jpg'><br><br><a href='/spots/marina-micro-spot'>Go to the spot</a>");
worldTradeCenter.bindPopup("<b>World Trade Center</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/265/square/wtc.png?1438730516'><br><br><a href='/spots/world-trade-center'>Go to the spot</a>");
sants.bindPopup("<b>Estació de Sants</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/267/square/sants.jpg'><br><br><a href='/spots/estacio-de-sants'>Go to the spot</a>");
mercatDeLesFlors.bindPopup("<b>Mercat de les Flors</b><br><br><img src='http://s3.amazonaws.com/ownthespot/spots/logos/000/000/251/square/mercat.jpg'><br><br><a href='/spots/mercat-de-las-flors'>Go to the spot</a>");


  function fadeAlert(){
    $('.alert-temp').removeClass('in');
  }

  function removeAlert(){
    $('.alert-temp').fadeOut("slow");
  }

  window.setTimeout(fadeAlert,1000);
  window.setTimeout(removeAlert,5000);
});
