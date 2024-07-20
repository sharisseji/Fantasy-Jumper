//-------------------------------------------------------
//Tutorial movement
void moveChar0() {
  if (keys[2] && platformOnCheck()) { // if the UP key is pressed and the object is on the ground
    jumpSound.trigger();
    objectVy = JUMP_SPEED;
    
  } else if (keys[1] && object0X > 0) { //move left
    image(object_left, object0X, object0Y);
    objectVx = -RUN_SPEED;
    
  } else if (keys[0] && object0X < width-objectW) { //move right
    image(object_right, object0X, object0Y);
    objectVx = RUN_SPEED;
    
  } else {
    objectVx = 0;
  }

  object0X = object0X + objectVx;   
  objectVy = objectVy + GRAVITY;
  object0Y = object0Y + objectVy;

  //if collides with the GROUND - then restarts
  if (object0Y+objectH >= GROUND0) {
    object0X = 10;
    object0Y = 125;
  }

  //going to LEVEL 1
  if (object0X+objectW >=925) {
    screen = 4;
  }
}

//-------------------------------------------------------
//LEVEL 1 MOVEMENT
void moveChar1() {
  // checks if the object is on the GROUND or on the platform. 
  // If you have many platform you will need a loop to check all the options not just GROUND - 150 // platformOnCheck

  if (keys[2] && objectY + objectH == GROUND  || keys[2] && platformOnCheck()) {// if the UP key is pressed and the object is on the ground 
    jumpSound.trigger();
    objectVy = JUMP_SPEED;
    
  } else if (keys[1] && objectX > 0) { //move left
    image(object_left, objectX, objectY);
    objectVx = -RUN_SPEED;
    
  } else if (keys[0] && objectX < width-objectW) { //move right
    image(object_right, objectX, objectY);
    objectVx = RUN_SPEED;
    
  } else {
    objectVx = 0;
  }

  objectX = objectX + objectVx; // move the object in horizontal direction  
  objectVy = objectVy + GRAVITY; // update object's vertical velocity  
  objectY = objectY + objectVy; // move the object in vertical direction

  // collides with the GROUND
  if (objectY+objectH >= GROUND) {
    objectY = GROUND - objectH;
    objectVy = 0;
  }

  //door to LEVEL 2 (screen 5)
  if (objectY+objectH >= 650 && objectX+objectW >=950) {
    keys[2] = false;
    screen = 5;
  }
}

//-------------------------------------------------------
//LEVEL 2 MOVEMENT
void moveChar2() {
  if (keys[2] && platformOnCheck()) { // if the UP key is pressed and the object is on the ground
    jumpSound.trigger();
    objectVy = JUMP_SPEED2;
    
  } else if (keys[1] && object2X > 0) { //move left
    image(object_left, object2X, object2Y);
    objectVx = -RUN_SPEED2;
    
  } else if (keys[0] && object2X < width-objectW) { //move right
    image(object_right, object2X, object2Y);
    objectVx = RUN_SPEED2;
    
  } else {
    objectVx = 0;
  }

  object2X = object2X + objectVx;   
  objectVy = objectVy + GRAVITY;
  object2Y = object2Y + objectVy;

  // collides with the GROUND lose life and reset
  if (object2Y+objectH >= GROUND2) {
    loseLife.trigger();
    object2X = 75;  
    object2Y = GROUND2-50-objectH;
    coinReset();
    numlives --;
  }

  //going to LEVEL 3 (screen 6)
  if (object2Y-objectH <= 100 && object2X+objectW >=950) {
    screen = 6;
  }
}

//-------------------------------------------------------
//LEVEL 3 MOVEMENT
void moveChar3() {
  if (keys[2] && platformOnCheck()) {// if the UP key is pressed and the object is on the ground
    jumpSound.trigger();
    objectVy = JUMP_SPEED2;
    
  } else if (keys[1] && object3X > 0) { //move left
    image(object_left, object3X, object3Y);
    objectVx = -RUN_SPEED2;
  } else if (keys[0] && object3X < width-objectW) { //move right
    image(object_right, object3X, object3Y);
    objectVx = RUN_SPEED2;
  } else {
    objectVx = 0;
  }

  object3X = object3X + objectVx;
  objectVy = objectVy + GRAVITY;
  object3Y = object3Y + objectVy;

  // collides with the GROUND lose life and reset
  if (object3Y+objectH >= GROUND3) {
    loseLife.trigger();
    object3X = 50;
    object3Y = GROUND2-700-objectH;
    coinReset();
    numlives--;
  }
  //going to LEVEL 3 (screen 6);
  if (object3Y+objectH > 350 && object3Y+objectH < 450 && object3X+objectW >=950) {
    victory.trigger();
    screen = 8; //victory screen
  }
}
