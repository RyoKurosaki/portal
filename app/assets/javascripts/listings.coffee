//= require fileupload.js
//= require ajax_replace_select.coffee

$ ->
  $('#checkin').datetimepicker
    ignoreReadonly: true
    defaultDate: moment({ h: 15 })
  $('#checkout').datetimepicker
    ignoreReadonly: true
    defaultDate: moment({ h: 11 })
