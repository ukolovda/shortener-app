window.datepicker_options = {
  dateFormat: 'yy-mm-dd'
}
#$.datepicker.setDefaults(window.datepicker_options);
$(document).ready ()->
  $("input.date_picker").datepicker(window.datepicker_options)
