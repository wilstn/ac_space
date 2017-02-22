var answer;
var min = 0;
var max = 100;
var explosion = "<img src=explosion.jpg width=500>"

function randNumber(min, max){
  answer = Math.floor(Math.random() * (max-min) + min);
}
randNumber(0, 100);

function getUserInput(){
  if(event.keyCode == 13){
    var userInput = document.getElementById('user-input').value

    if(userInput > max){
      document.getElementById('result').innerHTML = 'Please enter number less than max';
    }else if(userInput < min){
      document.getElementById('result').innerHTML = 'Please enter number greater than min';
    }else{
      document.getElementById('result').innerHTML = ""
      checkAnswer(userInput);
    }
  }
}

function checkAnswer(guess){
  if(guess == answer){
    document.getElementById('result').innerHTML = 'Boom. You ded';
    document.getElementById('image').innerHTML = explosion;
  }else if(guess > answer){
    max = guess;
    document.getElementById('max').innerHTML = max;
  }else{
    min = guess;
    document.getElementById('min').innerHTML = min;
  }
}
