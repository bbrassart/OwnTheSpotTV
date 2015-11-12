
var SpotDropdown = function() {
  this.init();
}

SpotDropdown.prototype.init = function () {
  $("#show_spot_info").on('click', function() {
    $("#show_spot_info-button").fadeToggle("fast");
  });

  $("#show_skater_info").on('click', function() {
    $("#show_skater_info-button").fadeToggle("fast");
  });
}
