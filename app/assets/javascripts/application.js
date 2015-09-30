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
//= require_tree ./vendor/foundation/libraries
//= require vendor/foundation/foundation.js
//= requrie vendor/foundation/foundation.equalizer.js
//= require matchHeight
//= require colorbox
//= require components/google_maps
$(function() {
  if (Modernizr.mq('only screen and (min-width: 768px)')) {
    $('.colorbox-youtube').colorbox({
      iframe: true,
      innerWidth: 640,
      innerHeight: 390
    });
  } else {
    $('.colorbox-youtube').attr('target', '_blank');
  }
});
