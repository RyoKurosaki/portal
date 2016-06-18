//= require fileupload.js
//= require ajax_replace_select.coffee

$ ->
  activity_service_start_time_at = new Date($('#activity_service_start_time_at').val())
  start_time_at = moment(activity_service_start_time_at).format("H")
  end_time_at = moment(new Date($('#activity_service_end_time_at').val())).format("H")
  $('#expectedtime').datetimepicker
    ignoreReadonly: true
    defaultDate: activity_service_start_time_at
    disabledTimeIntervals: [[moment({ h: 0 }), moment({ h: start_time_at })],[moment({ h: end_time_at }), moment({ h: 24 })]]
