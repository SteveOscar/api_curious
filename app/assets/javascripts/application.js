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
//= require_tree .
//= require bootstrap-sprockets
//= require jquery.simplyscroll


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

  // Fades in/out the name and bio on the dashboard
  $('.hi').delay( 1300 ).fadeTo('slow', 0, function(){
    $('.hi').remove();
  });
  $('.bio').delay( 2300 ).fadeTo('slow', 1);

  $('.blurb').delay( 1800 ).fadeTo('slow', 0, function(){
    $('.blurb').remove();
  });

  // The list of tweets
  $('.pillar').delay( 2000 ).fadeTo('slow', 1);

  $("#scroller").simplyScroll({
    customClass: 'vert',
    orientation: 'vertical',
    direction: 'backwards',
    frameRate: 25
  });

  $('.retweet').click(function() {
      $(this).hide();
  });

});
