//This function draws the INTRO screen.
void intro() {
  //background(#5BB197);
  introAnimation.show();
  introLayout();
}

void introLayout() {
  fill(#5BB197);
  strokeWeight(10);
  textFont(retroica);
  textSize(textsize);
  text("FOX DEFENCE", 500, 375);
  start.show();
  textsize = sin(angle)*20 + 110;
  angle = angle + 0.05;

  if (start.clicked) {
    mode = PLAY;
  }
}
