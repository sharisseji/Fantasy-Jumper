void startMenu() {
  background(0);
  image(startBG, 0,0);
  println(mouseX +", "+ mouseY);
  
  textAlign(CENTER, CENTER);
  textFont(font3);
  fill(10,130,0);
  textSize(225);
  text("FANTASY", 500, 175);
  
  textSize(300);
  text("JUMPER", 500, 375);

  //-------------------------------------------//
  //PLAY GAME BUTTON
  if (mouseX>400 && mouseX<600 && mouseY>560 && mouseY<660 && change == true) { //play button
    fill(15,180,0);
    textSize(80);
    text("PLAY", 500, 600);

    if (mousePressed) {
      //gameON = true;
      screen = 3; //tutorial
      change = false;
    }
  } else {
    fill(10,130,0);
    textSize(100);
    text("PLAY", 500, 600); //("text", x, y)
  }
}
