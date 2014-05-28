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

  // This editor has the current_user's document
  var editor1 = $('.e1').data('ace').editor.ace;
  // This editor has the friend's document
  var editor2 = $('.e2').data('ace').editor.ace;
  editor2.setReadOnly(true);

  editor1.getSession().on('change', function(event) {
    var text = editor1.getValue();
    var myParam = window.location.pathname.split('/')[2]
    $.ajax({
      type: 'put',
      url: '/documents',
      data: {
        "document": {
          "text": text,
          "friendship_id": myParam,
          "user_id": $('.e1').attr('id')
        }
      },
      dataType: "json",
      success: function(data) {
        console.log(data);
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  });

  setInterval(function() {
    var text = editor2.getValue();
    var myParam = window.location.pathname.split('/')[2]
    $.ajax({
      type: "get",
      url: "/documents",
      data: {
        "document": {
          "text": text,
          "friendship_id": myParam,
          "user_id": $('.e2').attr('id')
        }
      },
      datatype: "json",
      success: function(data) {
        console.log(data);
        if (data.text != text) {
          editor2.setValue(data.text); //might need a , 1 after data.text
        };
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  }, 5000); //time in milliseconds, 5 seconds

});