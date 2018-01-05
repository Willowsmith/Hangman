size(400, 400);

background(0, 0, 0);

function hangedcolor () {
	stroke(255, 255, 255);
	strokeWeight(3);
};

var numWrong = 0;

//gallows
var gallows = [
	// Gallows Base
	function () {
		hangedcolor();
		line(200, 250, 350, 250);
	},
	function gpost () {
		hangedcolor();
		line(280, 65, 280, 250);
	},
	function glift () {
		hangedcolor();
		line(200, 65, 280, 65);
	},
	function grope () {
		hangedcolor();
		line(200, 65, 200, 103);
	},
	function head () {
		hangedcolor();
		ellipse(200, 115, 40, 40);
	},
	function body () {
		hangedcolor();
		line(200, 135, 200, 190);
	},
	function rarm () {
		hangedcolor();
		line(200, 135, 180, 160);
	},
	function larm () {
		hangedcolor();
		line(200, 135, 220, 160);
	},
	function rleg () {
		hangedcolor();
		line(200, 192, 180, 220);
	},
	function lleg () {
		hangedcolor();
		line(200, 192, 220, 220);
	}
];

var Letter = function(x, y, letter) {
	this.x = x;
	this.y = y;
	this.state = 0;
	this.size = 15;
	this.letter = letter;
};


Letter.prototype.isUnderMouse = function(x, y) {
	//alert("X: " + x + "\nY: " + y + "\nThis X: " + this.x + "\nThis Y: " + this.y + "\nsize: " + this.size);
    return x >= this.x && x <= this.x + this.size  &&
        y >= this.y && y <= this.y + this.size;
};

Letter.prototype.isAlreadyClicked = function() {
	if (this.state = 0) {
		return false;
	}
	else {
		return true;
	}
};
//We are going to choose a color here
Letter.prototype.draw = function() {
	switch (this.state)	{
		case 1: 
			fill(0,255,0);
			break;
		case 2: 
			fill(255, 0, 0);
			break;
		default:
			fill(255, 255, 255);
			break;
	}
	textMode(SCREEN);
	textAlign(CENTER);
	textSize(this.size);
	text(this.letter, this.x, this.y, this.size, this.size);
};

var alphabet = [];
for (var i = 0; i < 26; i++) {
	var myLetter = new Letter(i * 15, 20, String.fromCharCode(65 + i));
	alphabet.push(myLetter);
	alphabet[i].draw();
}

mouseClicked = function() {
	var found = false;
	for (var k = 0; k < alphabet.length && found == false; k++) {
		if (alphabet[k].isUnderMouse(mouseX, mouseY)) {
			found = true;
			//alert("word is: " + gameWord.word + "\nLetter is: " + alphabet[i].letter);
			if (gameWord.word.toUpperCase().indexOf(alphabet[k].letter) == -1) {
				alphabet[k].state = 2;
				numWrong++;
				drawGallows();
			}
			else {
				alphabet[k].state = 1;
			}
			alphabet[k].draw();
		}
		
	}
	gameWord.draw();
};

// Draw the gallow & hanged man just for shits & giggles 
function drawGallows () {
	for (var i = 0; i < numWrong; i++) {
		gallows[i]();
	}
};


/*
var myLetter1 = new Letter(20, 20, "A");
var myLetter2 = new Letter(25, 25, "B");
var myLetter3 = new Letter(30, 30, "C");
myLetter2.state = 1;
myLetter3.state = 2;
myLetter1.draw();
myLetter2.draw();
myLetter3.draw();


var strings = [
	"Purple",
	"Yellow",
	"Green",
	"Blue",
	"Chicken"
];

alert("Hello");

for (var j = 0; j < strings.length; j++) {
	alert(strings[j]);
}
*/

//hanged man

/*ellipse(200, 115, 40, 40);
line(200, 135, 200, 190);
line(200, 135, 180, 160);
line(200, 135, 220, 160);
line(200, 192, 180, 220);
line(200, 192, 220, 220);
*/

var Word = function(words) {
	this.word = this.selectWord(words);
};

/* Here I created a function to choose a word from the words array randomly by creating a 
variable which stores the number randomly chosen, but constrained by the length of the words
list and rounded down. It then will return the word at that location in the list.*/
Word.prototype.selectWord = function (words) {
	var index = floor(random(words.length));
	return words[index];
};

/*This function is made to calculate the length of a string and return the numerical value
of the length of that string.*/
Word.prototype.calcLetter = function (inputWord) {
	var unique = inputWord.split('').filter(function(item, i, ar){ return ar.indexOf(item) === i; }).join('');
	return unique.length;
};

Word.prototype.draw = function () {
	fill(255, 255, 255);
	textMode(SCREEN);
	textAlign(CENTER);
	for(var i = 0; i < this.word.length; i++) {
		//made a variable to store the i'th letter of my word
		var currentChar = this.word[i];
		/*made a variable to convert the currentChar to uppercase then turn that into it's 
		Ascii equivalent.*/
		var charAscii = currentChar.toUpperCase().charCodeAt(0);
		/*made a variable that is the index for the alphabet array by turning the Ascii 
		value into something that goes from 0 to 25*/
		var alphaIndex = charAscii - 65;
		var currentLettah = alphabet[alphaIndex];
		textSize(currentLettah.size);
		if (currentLettah.state == 1) {
			text(currentLettah.letter, i * 20, 300, currentLettah.size, currentLettah.size);
		}
		else {
			text("_", i * 20, 300, currentLettah.size, currentLettah.size);
		}
	}
};


var words = [
	"quetzalcoatl",
	"sequoia",
	"asexual",
	"livid",
	"chthonic",
	"zwieback",
	"phylum",
	"buzzing"	
];
var gameWord = new Word(words);
gameWord.draw();

/*This is a variable to call the word function then store the returned value.
var gWord = word();



This calls the calcLetter function and inputs the value of the variable gWord and stores
that data into a variable.
var numULetters = calcLetter(gWord);
*/

