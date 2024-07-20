void score() {
  colorMode(HSB, 360, 255, 255, 100);
  fill(255,0,255,50);
  rect(910,750, 100, 50);
  fill(255,100);
  
  colorMode(RGB,255, 255, 255);
  textFont(font1);
  textSize(50);
  fill(0);
  textAlign(LEFT, TOP);
  text(nf(score, 2), 930, 740);
  textFont(font2);
}

void lives() {
  if (numlives == 3) {
    image(life3, 0, 750);
  } else if (numlives == 2) {
    image(life2, 0, 750);
  } else if (numlives ==1) {
    image(life1, 0, 750);
  } else if (numlives == 0) {
    //go to next state (GAME OVER state)
    gameMusic.pause();
    gameOver.trigger();
    screen = 7;
  }
}
