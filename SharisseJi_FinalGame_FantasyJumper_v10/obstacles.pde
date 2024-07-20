int obstacle0X = 775;
int obstacle0Y = 0;
int obStep0 = 1;

int obstacleVX [] = {200, 400, 600, 800};
int obstacleVY [] = {200, 800, 400, 600};
int obStep[]      = {1, 1, 1, 1};

int obstacleHX [] = {250, 500, 750, 300, 700, 500, 900}; //first 3 for screen 2, last 4 are for screen 3
int obstacleHY [] = {150, 375, 600, 200, 300, 500, 700};
int obStep1[] =     {1, 1, 1, 1, 1, 1, 1};

boolean [] obstacleMove1 = new boolean [3];
int obstacleSpeed = 8;
int obstacleSpeed2 = 5;

//distance for obstacle collisions
int distObstacle;

//-------------------------------------------------------
//DRAWING AND MOVING OBSTACLES
void moveObstacle() {
  
  //tutorial level - VERTICAL obstacle movement
  if (screen == 3) {
    if (obStep0 == 1) {
      image(obstacle_down, obstacle0X, obstacle0Y);
      obstacle0Y += obstacleSpeed2;
      if (obstacle0Y+50 >= 350) {
        obStep0 = 2;
      }
    }
    if (obStep0 == 2) {
      image(obstacle_up, obstacle0X, obstacle0Y);
      obstacle0Y -= obstacleSpeed2;
      if (obstacle0Y <= 0) {
        obStep0 = 1;
      }
    }
  }

  //LEVEL 1 - VERTICAL obstacle movement
  if (screen == 4) {
    for (int i = 0; i<4; i++) {
      if (obStep[i] == 1) {
        image(obstacle_down, obstacleVX[i], obstacleVY[i]);
        obstacleVY[i] += obstacleSpeed;
        if (obstacleVY[i]+50 >= 800) {
          obStep[i] = 2;
        }
      }
      if (obStep[i] == 2) {
        image(obstacle_up, obstacleVX[i], obstacleVY[i]);
        obstacleVY[i] -= obstacleSpeed;
        if (obstacleVY[i] <= 0) {
          obStep[i] = 1;
        }
      }
    }
  }

  //LEVEL 2 - HORIZONTAL obstacle movement
  if (screen == 5) {
    for (int i = 0; i<3; i++) { //first 3 obstacles
      if (obStep1[i] == 1) {
        obstacleHX[i] += obstacleSpeed2;
        image(obstacle_right_red, obstacleHX[i], obstacleHY[i]);

        if (obstacleHX[i]+50 >= 1000) {
          obStep1[i] = 2;
        }
      }
      if (obStep1[i] == 2) {
        obstacleHX[i] -= obstacleSpeed2;
        image(obstacle_left_red, obstacleHX[i], obstacleHY[i]);
        if (obstacleHX[i] <= 0) {
          obStep1[i] = 1;
        }
      }
    }
  }

  //LEVEL 3 - obstacle movement
  if (screen == 6) {
    for (int i = 3; i<7; i++) { //last 4 obstacles
      if (obStep1[i] == 1) {
        image(obstacle_right, obstacleHX[i], obstacleHY[i]);
        obstacleHX[i] += obstacleSpeed2;

        if (obstacleHX[i]+50 >= 1000) {
          obStep1[i] = 2;
        }
      }
      if (obStep1[i] == 2) {
        image(obstacle_left, obstacleHX[i], obstacleHY[i]);
        obstacleHX[i] -= obstacleSpeed2;

        if (obstacleHX[i] <= 0) {
          obStep1[i] = 1;
        }
      }
    }
  }
}

//-------------------------------------------------------
//OBSTACLE COLLISIONS
void obstacleCollisions() {
  
  //TUTORIAL LEVEL obstacle collisions
  if (screen ==3) {
    distObstacle = distance(obstacle0X, obstacle0Y, object0X, object0Y);
    if (distObstacle <50) {
      loseLife.trigger();
      object0X = 10;
      object0Y = 125;
    }
  }
  
  //LEVEL 1 obstacle collisions
  if (screen == 4) {
    for (int i = 0; i<4; i++) {
      distObstacle = distance(obstacleVX[i], obstacleVY[i], objectX, objectY);
      if (distObstacle < objectW+15) {
        loseLife.trigger();
        objectX = 75;
        objectY = GROUND-700;
        coinReset();
        numlives --;
      }
    }
  }
  
  //L2
  if (screen ==5) {
    for (int i = 0; i<3; i++) { //first 3 obstacles in the second array
      distObstacle = distance(obstacleHX[i], obstacleHY[i], object2X, object2Y);
      if (distObstacle < 50) {
        loseLife.trigger();
        object2X = 75;  
        object2Y = GROUND2-50-objectH;
        coinReset();
        numlives --;
      }
    }
  }
  
  //L3
  if (screen == 6) {
    for (int i = 3; i<7; i++) { //last 4 obstacles in the second array
      distObstacle = distance(obstacleHX[i], obstacleHY[i], object3X, object3Y);
      if (distObstacle < 50) {
        loseLife.trigger();
        object3X = 50;
        object3Y = GROUND2-700-objectH;
        coinReset();
        numlives --;
      }
    }
  }
}
