var answerSet = [];

var randomSelect = function (min, max){
  var randomNumber = Math.floor(Math.random()*(max - min) + min);
  return randomNumber;
};

function drag(ev) {
 ev.dataTransfer.setData("text", ev.target.id);
}
function allowDrop(ev){
  ev.preventDefault();
}
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    var want = document.getElementById(data).cloneNode(true);
    ev.target.parentNode.replaceChild(want, ev.target);
}

function startGame(){
  var colorSet = ['black', 'blue', 'green', 'red', 'orange', 'yellow'];

  var answerSetLen = 4;

  for(var i = 0; i < answerSetLen; i++){
    answerSet.push(colorSet[randomSelect(1,4)]);
  }
  console.log("Answer set is: " + answerSet)
}

function parseInput(daClick){
  var rowAnswer = [];
  var rowSelector = daClick.parentNode.parentNode.id

  for(var i = 1; i <= 4; i++){
    rowAnswer.push(document.getElementById(rowSelector).children[i].children[0].name)
  }
  console.log("Input row is: " + rowAnswer)
  checkUserInput(rowAnswer, rowSelector)
}

function checkUserInput(userInputToArray, rowSelector){
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

  result = [whites, red]
  console.log("White, red = " + result)
  displayResult(result, rowSelector)
}

function displayResult(result, rowSelector){
  var checkPos = 4
  var whitey = result[0]
  var redy = result[1]
  var daFirstRow = document.getElementById(rowSelector).children[5].children[0].children[0].children[0]
  var daSecondRow = document.getElementById(rowSelector).children[5].children[0].children[0].children[1]

  for(var i = 0; i < checkPos; i++){
    if(i < 2){
      if(redy > 0){
        redy--;
        daFirstRow.children[i].children[0].src = 'red2.png'
      }else if(whitey > 0){
        whitey--;
        daFirstRow.children[i].children[0].src = 'white.png'
      }
    }else{
      nextRow = i - 2
      if(redy > 0){
        redy--;
        daSecondRow.children[nextRow].children[0].src = 'red2.png'
      }else if(whitey > 0){
        whitey--;
        daSecondRow.children[nextRow].children[0].src = 'white.png'
      }
    }
  }
}

startGame();

$(".buttonClick").click(function(){
  parseInput(this)
});
$(".showAnswer").click(function(){
  for(var i = 0; i < 4; i++){
    console.log(document.getElementById("answerRow").children[i].children[0].src = answerSet[i] + ".png")
  }
});
