$(document).ready(function() {
  $('select').material_select();

  $('.datepicker').pickadate({
    format: "d mmmm, yyyy",
    formatSubmit: "yyyy-mm-dd 00:00:00",
    selectMonths: true,
    selectYears: 15
  });
});

$(document).on('turbolinks:load', function() {
  $(".dropdown-button").dropdown();

  $(".button-collapse").sideNav();

  $('.collapsible').collapsible();
})
