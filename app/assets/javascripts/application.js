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







$(document).ready(function(){

  var map = L.map('map').setView([41.394, 2.146], 13);
  var macba = L.marker([41.382950, 2.167280]).addTo(map);
  var placaUniversitat = L.marker([41.385727, 2.164016]).addTo(map);
  var hotelVela = L.marker([41.368066, 2.190249]).addTo(map);
  var macbaDownhill = L.marker([41.384521, 2.165832]).addTo(map);
  var arcDeTriomf = L.marker([41.389483, 2.183147]).addTo(map);
  var parcCiutadella = L.marker([41.386411, 2.186643]).addTo(map);
  var montbau_manual_pad = L.marker([41.430239, 2.145480]).addTo(map);
  var montbau_downhill = L.marker([41.432158, 2.148331]).addTo(map);
  var hostafrancs = L.marker([41.376212, 2.142402]).addTo(map);
  var barceloneta_banks = L.marker([41.382308, 2.186439]).addTo(map);
  var placa_anna_frank = L.marker([41.402490, 2.154398]).addTo(map);
  var fondo_skatepark = L.marker([41.453590, 2.224726]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);
  var barceloneta_banks = L.marker([41.381761, 2.186448]).addTo(map);


  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: 'bbrassart.b9fba4af',
      accessToken: 'pk.eyJ1IjoiYmJyYXNzYXJ0IiwiYSI6IjU2MTZjMjRmMjE2MmE4M2Q0OWEwMDVkYTc5YzM3M2Y3In0.V44T7lzZarK4_QwAwoEClw'
  }).addTo(map);


macba.bindPopup("<b>Macba</b><br><a href='/spots/macba'>Go to the spot</a>");

  function fadeAlert(){
    $('.alert-temp').removeClass('in');
  }

  function removeAlert(){
    $('.alert-temp').fadeOut("slow");
  }

  window.setTimeout(fadeAlert,1000);
  window.setTimeout(removeAlert,5000);
});
