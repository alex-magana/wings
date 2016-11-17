var bookings_ready;
bookings_ready = function() {
  initial_cost();

  $("#add-passenger").on("click", function(event){
    $("#passenger_count").val(parseInt($("#passenger_count").val()) + 1);
    $("#booking_cost").val(calculate_cost(true));
  });

  $(document).on("click", "a.remove", function(){
    $("#passenger_count").val(parseInt($("#passenger_count").val()) - 1);
    $("#booking_cost").val(calculate_cost(false));
  });

  function initial_cost() {
    $("#booking_cost").val("USD. " + (parseInt($("#flight_cost").val()) *
      parseInt($("#passenger_count").val())));
  }

  function calculate_cost(status) {
    if (status) {
      return "USD. " + (parseInt($("#flight_cost").val()) *
        parseInt($("#passenger_count").val()));
    } else {
      return "USD. " + (parseInt($("#flight_cost").val()) *
        parseInt($("#passenger_count").val()));
    }
  }

};

$(document).ready(bookings_ready);
$(document).on("page:load", bookings_ready);
