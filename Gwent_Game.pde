void setup() {
  fullScreen();
};
void draw() {
  int cardWidth = width/17;
  background(255);
  fill(211, 204, 154);
  rect(150, 0, width-300, 100);
  rect(150, height-100, width-300, 100);
  rect(25, height-100, width/17, 100);
  rect(width-cardWidth-25, height-100, cardWidth, 100);
  rect(25, 0, width/17, 100);
  rect(width-cardWidth-25, 0, cardWidth, 100);
  rect(125, 150, width-150, height-300);
  ellipse(60, (height/2), 75, 75);
}
