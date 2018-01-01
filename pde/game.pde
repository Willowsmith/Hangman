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

function word () {
	var index = floor(random(words.length));
	return words[index];
};
