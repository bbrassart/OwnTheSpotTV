
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
