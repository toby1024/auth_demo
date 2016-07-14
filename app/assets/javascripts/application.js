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
//= require jquery-migrate-min
//= require ztree.all
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN
//= require_tree .

$(document).on('ready page:load', function () {
    init();
});

function init() {
    $('.datepicker').datepicker({
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    $('.input-daterange').datepicker({
        todayHighlight: true,
        autoclose: true,
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
}
