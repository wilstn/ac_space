// 1) System generates a random number from 1-99
var answer;
var guess;
var min = 0;
var max = 100;
var explosion = "<img src=explosion.jpg width=500>"
var invalidInput = "<img src=invalidinput.jpg width=500>"
var invalidInput2 = "<img src=invalidinput2.jpg width=500>"

function randNumber(min, max){
  answer = Math.floor(Math.random() * (max-min) + min);
}
randNumber(0, 100);
// 2) User inputs a number from 1-99
function getUserInput(){
  if(event.keyCode == 13){
    var userInput = document.getElementById('user-input').value

    if(userInput > max){
      document.getElementById('result').innerHTML = 'Please enter number less than max';
      document.getElementById('image').innerHTML = invalidInput;
    }else if(userInput < min){
      document.getElementById('result').innerHTML = 'Please enter number greater than min';
      document.getElementById('image').innerHTML = invalidInput2;
    }else{
      guess = userInput;
      document.getElementById('result').innerHTML = ""
      checkAnswer(guess);
    }
  }
}

function checkAnswer(guess){
  if(guess == answer){
    // 5) The above goes on until user enters the correct number.
    // 6) Once, the user steps on the mine, he/she loses!
    document.getElementById('result').innerHTML = 'Boom. You ded';
    document.getElementById('image').innerHTML = explosion;
  }else if(guess > answer){
    // 3) If the user input is larger than the number, the maximum number reduces
    max = guess;
    document.getElementById('max').innerHTML = max;
  }else{
    // 4) If the user input is smaller than the number, the min number increases
    min = guess;
    document.getElementById('min').innerHTML = min;
  }
}
