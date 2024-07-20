void skipTutorial(){
  if (mouseX>160 && mouseX<250 && mouseY>0 && mouseY<40 && change == true) { //play button
    fill(15,180,0);
    textSize(20);
    text("SKIP", 205, 20);

    if (mousePressed) {
      //gameON = true;
      screen = 4; //go to level 1
      change = false;
    }
  } else {
    fill(10,130,0);
    textSize(30);
    text("SKIP", 205, 20);
  }
}

void exitButton(){
  //exit button
  if (mouseX>900 && mouseX<1000 && mouseY>0 && mouseY<45 && change == true) { //play button
    fill(15,180,0);
    textSize(40);
    text("EXIT", 950, 25);

    if (mousePressed) {
      exit();
    }
  } else {
    fill(10,130,0);
    textSize(50);
    text("EXIT", 950, 25); //("text", x, y)
  }
}
