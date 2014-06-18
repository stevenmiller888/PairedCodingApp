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
//= require ace/theme-chrome
//= require ace/theme-twilight
//= require ace/mode-ruby
//= require jquery-ace.min
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

var ready = function() {

  // This editor has the current_user's document
  var editor1 = $('.e1').data('ace').editor.ace;
  // This editor has the friend's document
  var editor2 = $('.e2').data('ace').editor.ace;
  // Set the editor with the friend's document to read-only
  editor2.setReadOnly(true);

  // When the current_user's editor changes, grab the text in the editor, grab the param that has the friendship_id,
  // then do an ajax put request so that we can go and update the document in the database. 
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
        // You probably don't want to console log this unless you're doing
        // development.  Might be worth taking out.
        console.log(data);
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  });

  // Set an interval for every x seconds to grab from the database the text in the friend's document, then 
  // set the value of the text in the friend's editor's document to the text field in the data we get back

  // This is not the most efficient way to achieve this.  You don't want to keep getting
  // from the server if a change hasn't been made.  Look into web sockets.
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
        editor2.setValue(data.text);
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  }, 1000); //time in milliseconds, 1 second

  // Add a Ruby interpreter
  // If the user presses the run button, then grab the text in the editor, and run .eval on it via the following:
  // code = editor1.getValue()
  // puts eval(code)

  $('#run1').on("click", function() {
    $('.i1').val("");
    var text = editor1.getValue();
    $.ajax({
      type: "post",
      url: "/documents",
      data: {
        "text": text
      },
      datatype: "json",
      success: function(data) {
        console.log(data.code);
        $('.i1').val(data["code"]);
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  });

  $('#run2').on("click", function() {
    $('.i2').val("");
    var text = editor2.getValue();
    $.ajax({
      type: "post",
      url: "/documents",
      data: {
        "text": text
      },
      datatype: "json",
      success: function(data) {
        console.log(data);
        $('.i2').val(data.code);
      },
      error: function(data) {
        console.log(data.responseText);
      }
    });
  });
};

//Fixes issue with turbolinks
// Good job here.
$(document).ready(ready);
$(document).on('page:load', ready)