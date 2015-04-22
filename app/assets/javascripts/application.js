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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function() {
  $("#title2").hide();
  $('.quo').hide();
  $('#goal_title1').change(function(){
      $('#title2')[ ($("option[value='custom']").is(":checked"))? "show" : "hide" ]();  
  });
  
  $('.goal').change(function(){
    $('.quo').show();
    $("#quote").text('I want to ' + [($("option[value='custom']").is(":checked"))? $("#title2").val() : $("#goal_title1 :selected").text()] + [($("option[value='words']").is(":checked"))? ' ' : ' for '] + $("#goal_quantity").val() + ' ' + $("#goal_unit :selected").text() + ' ' + $("#goal_frequency :selected").text() + '! ');
  });
});