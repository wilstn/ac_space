var randomSelect = function (min, max){
  var randomNumber = Math.floor(Math.random()*(max - min) + min);
  return randomNumber;
};

var answerSet = [];
var userInputToArray = [];
var tries = 10;
var result = [];

function startGame(){
  var colorSet = ['black', 'blue', 'green', 'red', 'orange', 'yellow'];

  var answerSetLen = 4;

  for(var i = 0; i < answerSetLen; i++){
    answerSet.push(colorSet[randomSelect(1,4)]);
  }
}

function getUserInput(){
  var userInput = prompt("Please enter 4 colors");
  userInputToArray = userInput.split(", ");
}

function checkUserInput(){
  var whites = 0;
  var red = 0;
  var clone = answerSet.slice(0);

  for(var i = 0; i < answerSet.length; i++){
    if(userInputToArray[i] == answerSet[i]){
      red++;
    }
  };

  for(var i = 0; i < userInputToArray.length; i++){
    if(clone.indexOf(userInputToArray[i]) != -1 ){
      clone.splice(clone.indexOf(userInputToArray[i]), 1);
      whites++;
    }
  }
  whites = whites - red;
  console.log(userInputToArray)
  result = [whites, red]
}

// Function play game
// document.addEventListener('DOMContentLoaded', function() {
function runGame(){
  startGame();
  do{
    getUserInput();
    checkUserInput();
    console.log("Whites: " + result[0] + " Red: " + result[1]);
    if(result[1] == 4){
      console.log("It is solved");
      break;
    }else{
      tries--;
      console.log(tries + " tries left");
    }
  }while(tries <= 10)
  console.log("The answer is: " + answerSet);
});
