# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var SpotDropdown = function() {
  this.spotButton = $("#show_spot_info-button");
  this.skaterButton = $("#show_skater_info-button");
  this.init();
}

SpotDropdown.prototype.init = function () {
  $("#show_spot_info").on('click', function() {
    this.spotButton.fadeToggle("fast");
  });

  $("#show_skater_info").on('click', function() {
    this.skaterButton.fadeToggle("fast");
  });
}
var listenToSpotsDropdown = new SpotDropdown();
