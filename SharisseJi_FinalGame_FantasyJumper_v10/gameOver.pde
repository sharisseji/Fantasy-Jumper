int highScore;

void GameOver(){
  textAlign(CENTER, CENTER);
  textFont(font3);
  
  fill(255,0,0);
  textSize(200);
  text("game", width/2, height/2-275);
  textSize(325);
  text("over", width/2, height/2-100);
  
  textSize(60);
  fill(255);
  text("coins " + nf(score,2), 500,475);
  highScore = max(score, highScore);
  text("high score " +nf(highScore,2), 500,525);
  
  //RESTART button
  if (mouseX>350 && mouseX<650 && mouseY>575 && mouseY<675 && change == true) { //play button
    fill(15,180,0);
    textSize(80);
    text("RESTART", 500, 625);

    if (mousePressed) {
      //gameON = true;
      numlives = 3;
      score = 0;
      coinReset();
      
      objectX = 75;  
      objectY = GROUND-700;
      object2X = 75;  
      object2Y = GROUND2-50-objectH;
      object3X = 50;
      object3Y = GROUND2-700-objectH;
      
      screen = 4; //start over at level 1, skip tutorial
      change = false;
    }
  } else {
    fill(10,130,0);
    textSize(100);
    text("RESTART", 500, 625); //("text", x, y)
  }
  exitButton();
  
}
