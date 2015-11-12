var SpotDropdown = function(button) {
  this.button = button;
  this.modal = modal;
  this.init();
}

SpotDropdown.prototype.init = function () {
  this.button.on('click', function() {
    this.modal.fadeToggle("fast");
  });

  this.button.on('click', function() {
    this.modal.fadeToggle("fast");
  });
}
