var function function_name (argument) {
  // body...
}

for (var i = Things.length - 1; i >= 0; i--) {
  Things[i]
};

for(i in arr){
  //do stuff
}

function protoPerson(firstName, lastName, age){
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
}
protoPerson.prototype.sayAge = function(first_argument) {
  console.log(this.age + "Is my age boiiii")
};
var Dad = new protoPerson("Jimmy", "John", 23)

addSubtract(1)(2)(3) //=> 0
function addSubtract(a) { 
  return function(b){
    return function(c){
        return a+b-c
      }
    }
  }


  var arrayUnique = function(a) {
    return a.reduce(function(p, c) {
        if (p.indexOf(c) < 0) p.push(c);
        return p;
    }, []);
};


function runner(fn){
  function curry(num){
    return function(nextNum){
      var tN = typeof nextNum;
      if(typeof num === 'undefined' && tN !== 'undefined'){
        return curry(nextNum);
      }else if(tN !== 'undefined'){
        return curry(fn(num, nextNum));
      }else{
        return num;
      }
    }
  }
  return curry();
}

function add(a, b){
  return a+b;
}
function multiply(a, b){
  return a*b;
}

runner(add)(1)(2)(3)

def getResult():
  # Get inputs
  nRows, nCols = map( int, input().split() )
  # Get grid
  grid = []
  for i in range( nRows ):
    grid.append( input() )

  nPatRows, nParCols = map( int, input().split() )
  # Get pattern
  pattern = []
  for j in range( nPatRows ):
    pattern.append( input() )

///////////////////////////////

function detectPattern(grid, pattern){
var i = 0
var found = 0
var j;
  while(i < grid.length){
    result = grid[i].indexOf( pattern[0] )
    if(result != -1){
      j = 0
      while(j < pattern.length && result != -1 && i < grid.length){
        if(result === grid[i].indexOf(pattern[j])){
        result = grid[i].indexOf( pattern[j] )
      }else{
        result = -1
      }
        i += 1
        j += 1
      }
      if(j == pattern.length && result != -1){
        found = 1
      }
      }
    
    i += 1
    }
  if(found){
    return "YES";
  }else{
    return "NO";
  }
}

