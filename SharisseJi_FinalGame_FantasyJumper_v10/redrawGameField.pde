//----------------------------------------------------------//
//DRAW TUTORIAL SCREEN
void tutorialScreen(){
  noStroke();
  image(startBG, 0,0);
  
  //label
  textFont(font1);
  textSize(30);
  fill(0);
  textAlign(LEFT, TOP);
  text("TUTORIAL", 10,0);
  
  //platforms 
  image(platformblock1, -50,150);
  image(platformblock1, 500,150);
  image(platformblock1, 950,150);//extension of previous one

  //door to get to level 1
  image(door, 930, 50);
  
  //object
  image(object_normal, object0X, object0Y);
  
  //tutorial instructions
  colorMode(HSB);
  fill(360,0,255,50);
  rect(25,315, 950, 450);
  image(tutorialMenu, 0,300);
  
  //Skip button
  colorMode(RGB);
  textAlign(CENTER, CENTER);
  textFont(font2);
  
  skipTutorial();
}

//----------------------------------------------------------//
//DRAW LEVEL 1 (no map, just platforms)
void redrawGameField1() {
  noStroke();
  colorMode(RGB);

  background(0);
  image(level1BG, 0, 0);

  //platforms
  image(platformblock1, pX, pY); //1
  image(platformblock1, pX+450, pY);

  image(platformblock1, pX2, pY2); //2
  image(platformblock1, pX2+450, pY2);

  image(platformblock1, pX, pY3); //3
  image(platformblock1, pX+450, pY3);

  image(platformblock1, pX2, pY4); //4
  image(platformblock1, pX2+450, pY4);

  //ground  
  image(groundblock1, 0, 750);
  image(groundblock1, 500, 750);
  
  //door from tutorial level
  image(door, -15, 50);
  
  //door to get to screen 2
  image(door, 925, 650);
  
  //label
  textFont(font1);
  textSize(30);
  fill(0);
  textAlign(LEFT, TOP);
  text("LEVEL 1", 10,0);
  
  //object
  image(object_normal, objectX, objectY);
}


//----------------------------------------------------------//
//SCREEN 2 MAP
//20 by 16 block map
int [][] screen2map = 
 {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0}};

//DRAW SCREEN 2
void redrawGameMap2() {
  noStroke();
  colorMode(RGB);
  image(level2BG, 0, 0); 

  int rows = screen2map.length;
  int columns = screen2map[0].length;

  for (int y=0; y < rows; y++) { 
    for (int x=0; x < columns; x++) {
      if (screen2map[y][x] == 1) {

        // draw the platforms (areas of collision)
        image(platformblock2, x*50, y*50);
      }
    }
    //draw the object
    image(object_normal, object2X, object2Y);
  }
  
  //starting door
  image(door, -15, 650);

  //ending door
  image(door, 950, 0);
  
  //label
  textFont(font1);
  textSize(30);
  fill(255);
  textAlign(LEFT, TOP);
  text("LEVEL 2", 10,0);
}


//----------------------------------------------------------//
//SCREEN 3 MAP
//20 by 16 block map
int [][] screen3map = 
 {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0}, 
  {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}};

//DRAW SCREEN 3
void redrawGameMap3() {
  noStroke();
  colorMode(RGB);
  image(level3BG, 0, 0); //background

  int rows3 = screen3map.length;
  int columns3 = screen3map[0].length;

  for (int y=0; y<rows3; y++) { 
    for (int x=0; x<columns3; x++) {
      if (screen3map[y][x]==1) {
        // draw the platforms
        image(platformblock3, x*50, y*50);
      }
    }
    //draw the object
    image(object_normal, object3X, object3Y);
  }
  
  //starting door
  fill(150, 80, 10);
  image(door, -15, 0);

  //ending door
  image(door, 950, 350);
  
  //label
  textFont(font1);
  textSize(30);
  fill(0);
  textAlign(LEFT, TOP);
  text("LEVEL 3", 100,0);
}
