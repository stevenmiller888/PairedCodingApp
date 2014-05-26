// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/jquery-1.8.3.min
//= require ace/ace
//= require ace/theme-twilight
//= require ace/mode-ruby
//= require jquery-ace.min
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  var decorator = $('.e1').data('ace');
  var decorator = $('.e2').data('ace');
  var aceInstance = decorator.ace;

  // This is the code that's in the editor at any given time
  // decorator.element[0].value 


});