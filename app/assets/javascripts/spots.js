var dropdown = {
  listen: function(card, arrow) {
    var oddClick = true;
    card.click(function() {
      card.animate({
          height: oddClick ? '-=55' : '+=55'
      },500);
      oddClick = !oddClick;
      arrow.toggleClass('invisible--arrow');
    })
  }
}
