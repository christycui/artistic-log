$(document).ready(function() {
  $(".datepicker").datepicker({
     dateFormat: "yy-mm-dd",
     maxDate: "0d"
  });
  
  if ($("option[value='Custom']").is(":checked")) { 
    $("#title2").show(); 
  } else {
    $("#title2").hide(); 
  }
  $('.quo').hide();
  $('#goal_title1').change(function(){
      $('#title2')[($("option[value='Custom']").is(":checked"))? "show" : "hide" ]();  
  });
  
  $('.goal').change(function(){
    $('.quo').show();
    $("#quote").text('I want to ' + [($("option[value='Custom']").is(":checked"))? $("#title2").val() : $("#goal_title1 :selected").text().toLowerCase()] + [($("option[value='words']").is(":checked"))? ' ' : ' for '] + $("#goal_quantity").val() + ' ' + $("#goal_unit :selected").text() + ' ' + $("#goal_frequency :selected").text() + '! ');
  });
  
  $('#goal_unit').change(function(){
    var unit_value = $(this).val();
    $(".input-group-addon").text(unit_value);
  });
  
  $("#entry_status_no").change(function() {
    if (this.checked) {
      $("#entry_quantity").val("0");
    } else {
      $("#entry_quantity").val("");
    };
  });
  
  $(".entry-icon").find("span").click(function(){
    $(this).parent().next().slideToggle("slow");
  });
});
