$(document).ready(function() {
  if ($("option[value='custom']").is(":checked")) { 
    $("#title2").show(); 
  } else {
    $("#title2").hide(); 
  }
  $('.quo').hide();
  $('#goal_title1').change(function(){
      $('#title2')[ ($("option[value='custom']").is(":checked"))? "show" : "hide" ]();  
  });
  
  $('.goal').change(function(){
    $('.quo').show();
    $("#quote").text('I want to ' + [($("option[value='custom']").is(":checked"))? $("#title2").val() : $("#goal_title1 :selected").text()] + [($("option[value='words']").is(":checked"))? ' ' : ' for '] + $("#goal_quantity").val() + ' ' + $("#goal_unit :selected").text() + ' ' + $("#goal_frequency :selected").text() + '! ');
  });
});
