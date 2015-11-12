var LoginValidation = function(button) {
  this.button = button;
  this.setInitalListeners();
}

LoginValidation.prototype.setInitalListeners = function() {
  this.button.on('click', function(event) {
    event.preventDefault();
    var input = $('input');
    console.log("hel")
    var index = 2;
    while ( index < ( input.length - 1 ) )
      if ( input[index].val() == "" ) {
        Materialize.toast('Please make sure all the fields were filled', 3000, 'rounded success--notif');
      }
    index++;
  })
}
