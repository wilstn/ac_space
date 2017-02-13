// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var msecCount = 0;
var secCount = 0;
var minCount = 0


function msecTimer(){
  msecCount ++;
  $('.milliseconds').text(msecCount);
  if (msecCount % 10 == 0){
    secCount ++;
    $('.seconds').text(secCount);
  };
  if (msecCount % 600 == 0){
    minCount ++;
    $('.minute').text(minCount);
  };
  // if (msecCount == 10){
  //   msecCount = 0;
  // };
  // if (secCount == 60){
  //   secCount = 0;
  // };
};

$(document).ready(function(){
  $('#start').click(function(){
    setInterval(msecTimer, 100);
  });
  $('#pause').click(function(){
    clearInterval(msecCount);
    clearInterval(secCount);
    clearInterval(minCount);
  });
})
