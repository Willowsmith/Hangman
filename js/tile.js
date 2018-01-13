var Letter = function(x, y, letter) {
	this.x = x;
	this.y = y;
	this.state = 0;
	this.size = 15;
	this.letter = letter;
};


Letter.prototype.isUnderMouse = function(x, y) {
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
	textSize(this.size);
	text(this.letter, this.x, this.y);
};

