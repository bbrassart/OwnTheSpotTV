var instaFeed = function() {
  this.url = "https://api.instagram.com/v1/users/self/feed?access_token=";
  this.setInitialListeners();
}

instaFeed.prototype.setInitialListeners = function() {
  $('.container').on('click', '#feed_launch', function(event) {
    var identifier = <%= current_user.access_token %>;
    this.processFeed(identifier).bind(this);
  });
}

instaFeed.prototype.processFeed = function(identifier) {
  var request = $.get(this.url + identitfier);
  request.done(function(response) {
    response[0].body["data"].forEach(function(media) {
      if (media["type"] == "video") {
        $('#display_feed').append(`<li>${media["link"]}</li>`);
      };
    });
  })
}
