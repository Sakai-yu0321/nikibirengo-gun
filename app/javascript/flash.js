$(document).on('turbolinks:load', function() {
  setTimeout("$('#flash_notice').slideDown('slow')", 100);
  setTimeout("$('#flash_notice').slideUp('slow')", 2500);
  setTimeout("$('#flash_alert').slideDown('slow')", 100);
  setTimeout("$('#flash_alert').slideUp('slow')", 2500);
});