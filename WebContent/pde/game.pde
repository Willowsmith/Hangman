size(400, 400);

background(0, 0, 0);

//gallows
stroke(255, 255, 255);
strokeWeight(3);
line(200, 65, 200, 103);
line(200, 65, 280, 65);
line(280, 65, 280, 250);
line(200, 250, 350, 250);

//hanged man
stroke(255, 255, 255);
strokeWeight(3);
ellipse(200, 115, 40, 40);
line(200, 135, 200, 190);
line(200, 135, 180, 160);
line(200, 135, 220, 160);
line(200, 192, 180, 220);
line(200, 192, 220, 220);

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
/* Here I created a function to choose a word from the words array randomly by creating a 
variable which stores the number randomly chosen, but constrained by the length of the words
list and rounded down. It then will return the word at that location in the list.*/
function word () {
	var index = floor(random(words.length));
	return words[index];
};
/*This is a variable to call the word function then store the returned value.*/
var gword = word();

/*This function is made to calculate the length of a string and return the numerical value
of the length of that string.*/
function calcletter (inputword) {
	var unique = inputword.split('').filter(function(item, i, ar){ return ar.indexOf(item) === i; }).join('');
	return unique.length;
};

/*This calls the calcletter function and inputs the value of the variable gword and stores
that data into a variable.*/
var length = calcletter(gword);
