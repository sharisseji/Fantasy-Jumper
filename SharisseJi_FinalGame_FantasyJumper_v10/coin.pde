// a function that calculates and returns the distance between two points as a decimal number
int distance (int x1, int y1, int x2, int y2) { //first coordinate and second coordinate
  return round(sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2))); //calculates distance using slope formula
}

//distances for coin collisions
int dist0;
int dist1; 
int dist2;
int dist3;

//COINS
int halfpW = 12;

int coinX [] = {200, 450, 700, 800, 550, 300, 200, 450, 700, 800, 550, 300}; //12 coins 
int coinY [] = {100, 100, 100, 250, 250, 250, 400, 400, 400, 550, 550, 550};

//level 2: 13 coins
int coin2X [] = {halfpW, 150+halfpW, 300+halfpW, 450+halfpW, 550+halfpW, 700+halfpW, 850+halfpW, 100+halfpW, 200+halfpW, 350+halfpW, 600+halfpW, 750+halfpW, 900+halfpW};
int coin2Y [] = {50, 150, 250, 400, 500, 600, 700, 700, 600, 500, 250, 150, 50};

//level 3: 6 coins
int coin3X [] = {500+halfpW, 200+halfpW, 700+halfpW, 500+halfpW, 200+halfpW, 700+halfpW};
int coin3Y [] = {25, 200, 200, 500, 700, 700};

boolean coin0Visible = true;
boolean [] coinVisible  = new boolean [12];
boolean [] coin2Visible = new boolean [13];
boolean [] coin3Visible = new boolean [6];
int coinD = 20;

//-------------------------------------------------------
//TURN ON COINS
void coinReset() {
  //level 1
  for (int i = 0; i<12; i++) {
    coinVisible[i] = true;
  }

  //level 2
  for (int i = 0; i<13; i++) {
    coin2Visible[i] = true;
  }

  //level 3
  for (int i = 0; i<6; i++) {
    coin3Visible[i] = true;
  }
}

//-------------------------------------------------------
//DRAW COINS
void coinDraw() {
  if (screen == 3) { //only one coin
    if (coin0Visible == true) image(coin, 600, 100);
  }
  if (screen == 4) {
    for (int i = 0; i<12; i++) {
      if (coinVisible[i] == true) {
        image(coin, coinX[i], coinY[i]);
      }
    }
  }
  if (screen == 5) {
    for (int i = 0; i<13; i++) {
      if (coin2Visible[i] == true) {
        image(coin, coin2X[i], coin2Y[i]);
      }
    }
  }
  if (screen == 6) {
    for (int i = 0; i<6; i++) {
      if (coin3Visible[i] == true) {
        image(coin, coin3X[i], coin3Y[i]);
      }
    }
  }
}
//-------------------------------------------------------
//COIN COLLISIONS
void coinCollision() {
  //TUTORIAL LEVEL
  if (screen == 3) {
    dist0 = distance(600, 100, object0X, object0Y);
    if (coin0Visible == true && dist0 < coinD+ 5) {
      coinSound.trigger();
      poofX = 600;
      poofY = 100;
      explodeTrigger = true;
      coin0Visible = false;
    }
  }

  //L1
  if (screen == 4) {
    for (int i = 0; i<12; i++) {
      dist1 = distance(coinX[i], coinY[i], objectX, objectY);
      if (coinVisible[i] == true && dist1 < coinD+5) {
        coinSound.trigger();
        poofX = coinX[i];
        poofY = coinY[i];
        explodeTrigger = true;

        coinVisible[i] = false;
        score += 1;
      }
    }
  }

  //L2
  if (screen ==5) {
    for (int i = 0; i<13; i++) {
      dist2 = distance(coin2X[i], coin2Y[i], object2X, object2Y);
      if (coin2Visible[i] == true && dist2 < coinD+ coinD/2) {
        coinSound.trigger();
        poofX = coin2X[i];
        poofY = coin2Y[i];
        explodeTrigger = true;

        coin2Visible[i] = false;
        score += 1;
      }
    }
  }

  //L3
  if (screen == 6) {
    for (int i = 0; i<6; i++) {
      dist3 = distance(coin3X[i], coin3Y[i], object3X, object3Y);
      if (coin3Visible[i] == true && dist3 < coinD+ coinD/2) {
        coinSound.trigger();
        poofX = coin3X[i];
        poofY = coin3Y[i];
        explodeTrigger = true;

        coin3Visible[i] = false;
        score += 1;
      }
    }
  }
}

//-------------------------------------------------------
//COIN COLLISION: poof explosion
//drawing and resetting sprites

void drawExplosion(int x, int y) {
  if (explodeTrigger == true) {
    image (poofImage[poofCF], x, y);
    poofCF++;
    if (poofCF >= 22) {
      explodeTrigger = false;
    }
  }
}

void resetExplosion() {
  if (explodeTrigger==false) {
    poofCF = 1;
  }
}
