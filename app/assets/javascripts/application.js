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

  var editor1 = $('.e1').data('ace').editor.ace;
  var editor2 = $('.e2').data('ace').editor.ace;

  editor1.getSession().on('change', function(e) {
    value = editor1.getValue();
    editor2.setValue(value, 1);
  });

  // load the document from the database using the friendship id

  // save the value to the database with the friendship id

  // editor2.getSession().on('change', function(e) {
  //   value = editor2.getValue();
  //   editor1.setValue(value, 1);
  // });

  // One person coding at a time?

});