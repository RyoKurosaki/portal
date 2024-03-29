// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.widget.js
//= require load-image.all.min.js
//= rewuire canvas-to-blob.min.js
//= require z.jquery.fileupload
//= require z.jquery.fileupload-process
//= require z.jquery.fileupload-image
//= require underscore
//= require gmaps/google
//= require bootstrap-sprockets
//= require moment
//= require bootstrap3-datetimepicker
//= require bootstrap-fileinput
//= require_tree .

var data = {'data-date-format': 'YYYY-MM-DD' };
var ua = navigator.userAgent.toLowerCase();
var isMobile = /iphone/.test(ua)||/android(.+)?mobile/.test(ua);
var ready = function(){
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker({
    ignoreReadonly: true,
    minDate: new Date()
  });
  if (!isMobile) {
    $('a[href^="tel:"]').on('click', function(e) {
      e.preventDefault();
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);
