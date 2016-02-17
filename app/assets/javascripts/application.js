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

  $('.fades1').delay( 200 ).fadeTo('slow', 1);
  $('.fades2').delay( 700 ).fadeTo('slow', 1);
  $('.fades3').delay( 1200 ).fadeTo('slow', 1);
  $('.circle-go').delay( 1000 ).fadeTo('slow', 0);
  $('.circle-come').delay( 1000 ).fadeTo('slow', 1);
  $('.circle2').delay( 1200 ).fadeTo('slow', 0.9);
  $('.circle3').delay( 1400 ).fadeTo('slow', 0.9);

  $('.hi').delay( 2200 ).fadeTo('slow', 0, function(){
    $('.hi').remove();
  });

  $('.bio').delay( 2000 ).fadeTo('slow', 0, function(){
    $('.bio').remove();
  });
  
  $('.pillar').delay( 2400 ).fadeTo('slow', 1);

  $("#scroller").simplyScroll({
    customClass: 'vert',
    orientation: 'vertical',
    direction: 'backwards',
    frameRate: 25
  });
});
