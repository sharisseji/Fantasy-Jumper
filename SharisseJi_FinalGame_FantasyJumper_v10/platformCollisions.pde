//loading platforms
//SCREEN 1
//P1
int pX = 0;
int pY = GROUND-600;
int pW = 900;
int pH = 25;

//P2
int pX2 = 100;
int pY2 = GROUND-450;
int pY3 = GROUND-300;
int pY4 = GROUND-150;

//----------------------------------------------------------//

//checks for collisions between the player and the platform
boolean collideRect(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) { //all the variables needed for each platform
  // distance between x-axis
  float distX = abs((x1+w1/2)-(x2+w2/2));
  // distance between y-axis
  float distY = abs((y1+h1/2)-(y2+h2/2));

  // comnined Half Widths
  float combinedHW = w1/2+w2/2;
  // comnined Half Heights
  float combinedHH = h1/2+h2/2;

  // collision check 
  if (distX<combinedHW && distY<combinedHH) return true;
  return false;
}

//----------------------------------------------------------//
// returns true if a player is on any of the platforms
boolean platformOnCheck() {
  boolean check = false;
  
  //tutorial screen
  if(screen ==3){
    for(int i = 0; i<5; i++){
      if(object0Y + objectH == 150 && object0X > 0 && object0X < 400) check = true; //coordinates of platform (0, 150, 400, pH)
      if(object0Y + objectH == 150 && object0X > 500 && object0X < 1000) check = true; //coords: (500,150, 500, pH)
    }
  }
  
  //LEVEL 1 (using individual platforms)
  if (screen ==4) {
    for (int i= 0; i< 5; i++) {
      if (objectY + objectH == pY  && objectX > pX  &&  objectX  < pX + pW)  check = true; //platform 1
      if (objectY + objectH == pY2 && objectX > pX2 &&  objectX  < pX2 + pW) check = true; //platform 2
      if (objectY + objectH == pY3 && objectX > pX  &&  objectX  < pX + pW)  check = true; //platform 3
      if (objectY + objectH == pY4 && objectX > pX2 &&  objectX  < pX2 + pW) check = true; //platform 4
    }
  }

  //SCREEN 2 (using map)
  if (screen ==5) {
    int rows= screen2map.length;
    int columns = screen2map[0].length;
    for (int y=0; y<rows; y++) { 
      for (int x=0; x<columns; x++) {
        if (screen2map[y][x]==1) {
          if (object2Y + objectH == y*50 && object2X > (x*50)-1 &&  object2X < (x*50) + 49) {
            check = true;
          }
        }
      }
    }
  }

  //SCREEN 3 (using map)
  if (screen == 6) {
    int rows3 = screen2map.length;
    int columns3 = screen2map[0].length;
    for (int y=0; y<rows3; y++) { 
      for (int x=0; x<columns3; x++) {
        if (screen3map[y][x]==1) {
          if (object3Y + objectH == y*50 && object3X > (x*50)-1 &&  object3X < (x*50) + 49) {
            check = true;
          }
        }
      }
    }
  }
  return check;
}

//----------------------------------------------------------//
//Platforms in tutorial screen
void platformCollisions0(){
  if (objectVy > 0 && collideRect(object0X, object0Y, objectW, objectH, 0, 150, 400, pH)) {
      object0Y = 150 - objectH;
      objectVy = 0;
  }
  if (objectVy > 0 && collideRect(object0X, object0Y, objectW, objectH, 500, 150, 500, pH)) {
      object0Y = 150 - objectH;
      objectVy = 0;
  }
}
//----------------------------------------------------------//
//Platforms in SCREEN 1
void platformCollisions1() {
  if (screen == 4) {
    // if the object is moving down and collides with the platform
    // P1
    if (objectVy > 0 && collideRect(objectX, objectY, objectW, objectH, pX, pY, pW, pH)) {
      objectY = pY - objectH;
      objectVy = 0;
    }
    // if the object is moving up (object Vy <0) and collides with the platform
    else if (objectVy < 0 && collideRect(objectX, objectY, objectW, objectH, pX, pY, pW, pH)) {
      objectY = pY + 3*pH;
      objectVy = 0;
    }

    //P2
    if (objectVy > 0 && collideRect(objectX, objectY, objectW, objectH, pX2, pY2, pW, pH)) {
      objectY = pY2 - objectH;
      objectVy = 0;
    }
    // if the object is moving up (object Vy <0) and collides with the platform
    else if (objectVy < 0 && collideRect(objectX, objectY, objectW, objectH, pX2, pY2, pW, pH)) {
      objectY = pY2 + 3*pH;
      objectVy = 0;
    }

    //P3
    if (objectVy > 0 && collideRect(objectX, objectY, objectW, objectH, pX, pY3, pW, pH)) {
      objectY = pY3 - objectH;
      objectVy = 0;
    }
    // if the object is moving up (object Vy <0) and collides with the platform
    else if (objectVy < 0 && collideRect(objectX, objectY, objectW, objectH, pX, pY3, pW, pH)) {
      objectY = pY3 + 3*pH;
      objectVy = 0;
    }

    //P4
    if (objectVy > 0 && collideRect(objectX, objectY, objectW, objectH, pX2, pY4, pW, pH)) {
      objectY = pY4 - objectH;
      objectVy = 0;
    }
    // if the object is moving up (object Vy <0) and collides with the platform
    else if (objectVy < 0 && collideRect(objectX, objectY, objectW, objectH, pX2, pY4, pW, pH)) {
      objectY = pY4 + 3*pH;
      objectVy = 0;
    }
  }
}

//----------------------------------------------------------//
//Platforms in SCREEN 2
void platformCollisions2() {
  if (screen == 5) {
    int rows= screen2map.length;
    int columns = screen2map[0].length;
    for (int y=0; y<rows; y++) { 
      for (int x=0; x<columns; x++) {
        if (screen2map[y][x]==1) {
          // if the object is moving down and collides with the platform
          if (objectVy > 0 && collideRect(object2X, object2Y, objectW, objectH, (x*50), (y*50), 50, 50)) {
            object2Y = (y*50) - objectH;
            objectVy = 0;
          }
        }
      }
    }
  }
}

//----------------------------------------------------------//
////Platforms in SCREEN 3
void platformCollisions3() {
  if (screen == 6) {
    int rows3 = screen3map.length;
    int columns3 = screen3map[0].length;
    for (int y=0; y < rows3; y++) { 
      for (int x=0; x < columns3; x++) {
        if (screen3map[y][x]==1) {
          // if the object is moving down and collides with the platform
          if (objectVy > 0 && collideRect(object3X, object3Y, objectW, objectH, (x*50), (y*50), 50, 50)) {
            object3Y = (y*50) - objectH;
            objectVy = 0;
          }
        }
      }
    }
  }
}
