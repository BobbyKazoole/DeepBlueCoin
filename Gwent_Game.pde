boolean graveyardFocused = false;
boolean boardFocused = true;
void setup() {
  fullScreen();
};
void draw() {
  if(boardFocused == true) {
    int cardWidth = width/17;
    int rowHeight = (height-250)/6;
    int rowWidth = width-150;
    int handWidth = width-300;
    background(255);
    fill(211, 204, 154);
    rect(150, 0, width-300, 100);
    rect(150, height-100, width-300, 100);
    rect(25, height-100, cardWidth, 100);
    rect(width-cardWidth-25, height-100, cardWidth, 100);
    rect(25, 0, width/17, 100);
    rect(width-cardWidth-25, 0, cardWidth, 100);
    rect(125, 125, width-150, height-250);
    ellipse(60, (height/2), 75, 75);
    strokeWeight(2);
    fill(255, 0, 0, 50);
    rect(125, 125, width-150, (height-250)/6);
    rect(125, 125+((height-250)/6), width-150, rowHeight);
    rect(125, 125+(2*rowHeight), width-150, rowHeight);
    fill(0, 0, 255, 50);
    rect(125, 125+(3*rowHeight), width-150, rowHeight);
    rect(125, 125+(4*rowHeight), width-150, rowHeight);
    rect(125, 125+(5*rowHeight), width-150, rowHeight);
    strokeWeight(1);
    fill(0, 255, 0, 25);
    for(int x = 0; x < 6; x = x+1) {
      for(int i = 0; i < 9; i = i+1) {
        rect(155+(i *(rowWidth/9)), 125+(x*rowHeight), cardWidth, rowHeight);
      }
    }
    for(int x = 0; x < 10; x = x + 1) {
      rect(167.5+(x*(handWidth/10)), 0, cardWidth, 100);
      rect(167.5+(x*(handWidth/10)), height-100, cardWidth, 100);
    }
  }
  if (graveyardFocused == true) {
    background(50, 50, 50);
  }
}/*end of draw*/

void mousePressed() {
  
}

void keyPressed() {
  if(key == 'g'){
    showHideGraveyard();
  }
}

void showHideGraveyard() {
  if(graveyardFocused == true) {
    graveyardFocused = false;
  }
  else {
    graveyardFocused = true;
  }
}
