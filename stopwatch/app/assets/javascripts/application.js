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
//= require bootstrap-sprockets

var msCount = 0;
var secCount = 0;
var minCount = 0;

function msTimer(){
  msCount++;
  if(msCount == 10){
    secTimer();
    msCount = 0;
  };
  $('.ms').text(msCount);
};

function secTimer(){
  secCount++;
  if(secCount == 60){
    minTimer();
    secCount = 0;
  };
  $('.sec').text(secCount);
};

function minTimer(){
  minCount++;
  $('.min').text(minCount);
};

function resetTimer(){
  msCount = 0;
  secCount = 0;
  minCount = 0;
};

var starter;

$(document).ready(function(){
  $('#start').click(function(){
    starter = setInterval(msTimer, 100);
  });

  $('#pause').click(function(){
    clearInterval(starter);
  });

  $('#pause').click(function(){
    resetTimer();
  });
});
