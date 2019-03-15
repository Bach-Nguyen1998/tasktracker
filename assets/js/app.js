// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";

$(function () {


  $('#start').click((ev) => {
    let start_time = new Date().toUTCString();

    let task_id = $(ev.target).data('task-id');
    window.start_time = start_time;
  })

  $('#end').click((ev) => {

    let task_id = $(ev.target).data('task-id');
    let end_time = new Date().toUTCString();
    let text = JSON.stringify({
      time_stamp: {
        task_id: task_id,
        start_time: start_time,
        end_time: end_time},});
    $.ajax(time_stamp_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
    });
   });

  $('.tb-show .edit button').click((ev) => {
	  let wrappingRow = $(ev.target).closest("tr");
	  let tbId = $(wrappingRow).data("tb-id");
	  let correspondingForm = $(".tb-edit[data-tb-id=" + tbId + "]")
	  $(correspondingForm).show();
	  $(wrappingRow).hide();
  })
  $('.submit').click((ev) => {
    let wrappingRow = $(ev.target).closest("tr");
    
    let task_id = $(wrappingRow).data('task-id');
    let timestampid = $(wrappingRow).data('tb-id');
    let newstart = $('.newstart[data-tb-id=' + timestampid +']').val();
    let newend = $('.newend[data-tb-id=' + timestampid +']').val();
    let text = JSON.stringify({
      time_stamp: {
        task_id: task_id,
        start_time: newstart,
        end_time: newend},});
    $.ajax(time_stamp_path, {
      method: "put",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: function (data) { 	
           
	  let correspondingDate = $(".tb-show[data-tb-id=" + timestampid + "]");
	  $(wrappingRow).hide();
	  $(correspondingDate).show();

 }
    });
  ev.preventDefault();


  });


});
