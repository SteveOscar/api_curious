$(document).ready(function(){

  // Fades for the navbar, splash page and background
  $('.fades1').delay( 200 ).fadeTo('slow', 1);
  $('.fades2').delay( 700 ).fadeTo('slow', 1);
  $('.fades3').delay( 1200 ).fadeTo('slow', 1);
  $('.circle-go').delay( 1000 ).fadeTo('slow', 0);
  $('.circle-come').delay( 1000 ).fadeTo('slow', 1);
  $('.bird').delay( 2000 ).fadeTo('slow', 0.1);
  $('.circle2').delay( 1200 ).fadeTo('slow', 0.6);
  $('.circle3').delay( 1400 ).fadeTo('slow', 0.7);

  // Animates the background bird
  function loop() {
      $('.bird').css({left:0});
      $('.bird').animate ({
          left: '+=700',
      }, 10000, 'linear', function() {
      });
  }
  loop();

  // Fades in/out the name and bio on the dashboard
  $('.hi').delay( 1300 ).fadeTo('slow', 0, function(){
    $('.hi').remove();
  });
  $('.bio').delay( 2300 ).fadeTo('slow', 1);

  $('.blurb').delay( 1500 ).fadeTo('slow', 0, function(){
    $('.blurb').remove();
  });

  // The list of tweets
  $('.pillar').delay( 2100 ).fadeTo('slow', 1);

  // Retweet, unfollow, and heart button behavior
  $('.retweet').click(function() {
      $(this).hide();
      $(".retweeted").show();
  });
  $('.unfollow').click(function() {
      $(this).fadeTo('slow', 0).hide();

  });
  $('.favorite').click(function() {
      $(this).addClass('hidden');
      var card = this.parent();
      $('.unfavorite', card).removeClass('hidden');
  });
  $('.unfavorite').click(function() {
      var card = this.parent();
      $(this).addClass('hidden');
      $('.favorite', card).removeClass('hidden');

  });

});
