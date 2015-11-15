var VideoInputs = function() {
  this.form = $("#new_video");
  this.setInitialListeners();
}

VideoInputs.prototype.setInitialListeners = function() {
  this.form.on('submit', function(event) {
    var url = $("#new_video #video_url").val();
    https://www.instagram.com/p/91yPIDCzYm/?taken-by=seedthespot
    if ( url.length < 28 ) {
      event.preventDefault();
      Materialize.toast("Sorry, this URL is not a proper Instagram URL", 3000, 'rounded danger--notif');
    }
  })
}

var LoginInputs = function() {
  this.form = $("#loginForm");
  this.setInitialListeners();
}

LoginInputs.prototype.setInitialListeners = function() {
  this.form.on('submit', function(event) {
    var name = $("#loginForm input[name=username]").val();
    var password = $("#loginForm input[name=password]").val();
    if ( name.length == 0 ) {
      event.preventDefault();
      Materialize.toast("Please type a username", 3000, 'rounded danger--notif');
    }
    else if ( password.length < 8 ) {
      event.preventDefault();
      Materialize.toast("Your password must be at least 8 characters long", 3000, 'rounded danger--notif');
    }
  })
}

var RegistrationInputs = function() {
  this.form = $("#new_skater");
  this.setInitialListeners();
}

RegistrationInputs.prototype.setInitialListeners = function() {
  this.form.on('submit', function(event) {
    var username = $("#new_skater #skater_username").val();
    var password = $("#new_skater #skater_password").val();
    var passwordConfirmation = $("#new_skater #skater_password_confirmation").val();
    if ( username.length == 0 ) {
      event.preventDefault();
      Materialize.toast("Please type a username", 3000, 'rounded danger--notif');
    }
    else if ( password.length < 8 ) {
      event.preventDefault();
      Materialize.toast("Your password must be at least 8 characters long", 3000, 'rounded danger--notif');
    }
    else if (password != passwordConfirmation) {
      event.preventDefault();
      Materialize.toast("The password and the password confirmation must be the same", 3000, 'rounded danger--notif');
    }
  })
}
