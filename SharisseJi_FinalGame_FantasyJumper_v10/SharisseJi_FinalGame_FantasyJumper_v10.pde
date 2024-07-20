///////////////////////////////////////////////////////////////////////////
//   File Name: Sharisse Ji - Final Game - Fantasy Jumper - version 10   //
//   Date: 01/17/22 - 01/28/22                                           //
//   Programmers: Sharisse Ji                                            //
//   Description: Navigate the cat through three levels, collecting      //
//                all coins and avoiding the dragons. If you fall out    //
//                of the screen or get hit by the dragons, then you      //
//                lose a life. Game is over when all lives are lost.     //
///////////////////////////////////////////////////////////////////////////

//AUDIO SETUP
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

//-------------------------------------------------------
//LOADING MEDIA-----------------------------------------
//audio
AudioPlayer gameMusic;
AudioSample jumpSound;
AudioSample coinSound;
AudioSample loseLife;
AudioSample gameOver;
AudioSample victory;

//fonts
PFont font1;
PFont font2;
PFont font3;

//backgrounds
PImage startBG;
PImage level1BG;
PImage level2BG;
PImage level3BG;

//tutorial
PImage tutorialMenu;

//map
PImage platformblock1;
PImage groundblock1;

PImage platformblock2;
PImage platformblock3;

PImage door;
PImage coin;

//coin explosions
boolean explodeTrigger = false;
int poofNF = 22;
PImage[] poofImage = new PImage [poofNF];
int poofCF = 1;
int poofX;
int poofY;

//obstacle
PImage obstacle_up;
PImage obstacle_down;
PImage obstacle_left;
PImage obstacle_right;

PImage obstacle_left_red;
PImage obstacle_right_red;

//objects
PImage object_normal;
PImage object_left;
PImage object_right;

//lives
PImage life1;
PImage life2;
PImage life3;
int numlives = 3;

//Gameplay------------------------------------------------------
//states
Boolean[] keys; //Representes each button input in its array
int screen = 1;
boolean change = true;

//ground and screen loading
int GROUND0 = 300;
int GROUND = 750;
int GROUND2 = 800;
int GROUND3 = 800;

//Object properties
//loading object in level 1
int objectW = 25;
int objectH = 25;

int object0X = 10;
int object0Y = 125;

int objectX = 75;  
int objectY = GROUND-700;

int object2X = 75;  
int object2Y = GROUND2-50-objectH;

int object3X = 50;
int object3Y = GROUND2-700-objectH;

//object velocity
int objectVx = 0; //velocity of x (kind of like speed)
int objectVy = 0;

int RUN_SPEED = 10;
int JUMP_SPEED = -20;

int RUN_SPEED2 = 5;
int JUMP_SPEED2 = -30;

int GRAVITY = 2;

//only allow jumping if the player is not already jumping
boolean jumping = true;

//SCORE
int score;


//-------------------------------------------------------
void setup() {
  size (1000, 800);
  colorMode(RGB,255, 255, 255);
  background(0);
  smooth();
  frameRate(50);

  //keys
  keys = new Boolean[5];
  keys[0]=false; // all are false, since they are not key pressed yet(only in keyPressed()
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  keys[4]=false;
  
  //audio
  minim = new Minim(this);
  
  //bg music
  gameMusic = minim.loadFile("game_music.mp3");
  gameMusic.setGain(-15);
  
  //sfx
  jumpSound = minim.loadSample("jumpsound.wav");
  jumpSound.setGain(-15);
  
  coinSound = minim.loadSample("coincollectionsound.wav");
  coinSound.setGain(-15);
  
  loseLife = minim.loadSample("loselife.wav");
  loseLife.setGain(-15);
  
  gameOver = minim.loadSample("gameoversound.wav");
  gameOver.setGain(-15);
  
  victory = minim.loadSample("victorysound.wav");
  victory.setGain(-15);

  //loading fonts
  font1 = createFont("MagicSchoolOne.ttf", 100);
  font2 = createFont("MedusaGothic D.otf", 100);
  font3 = createFont("Dearest Dorothy.ttf", 100);

  //loading backgrounds
  startBG = loadImage("theme2_gamebg1.png");
  startBG.resize(width, height);

  level1BG = loadImage("level1BG.png");
  level1BG.resize(width, height);

  level2BG = loadImage("level2BG.png");
  level2BG.resize(width, height);

  level3BG = loadImage("level3BG.png");
  level3BG.resize(width, height);

  tutorialMenu = loadImage("tutorialmenu_2.png");
  tutorialMenu.resize(1000, 500);

  //loading lives images
  life1 = loadImage("1heart.png");
  life1.resize(150, 50);
  life2 = loadImage("2hearts.png");
  life2.resize(150, 50);
  life3 = loadImage("3hearts.png");
  life3.resize(150, 50);
  
  //loading platform and ground blocks
  platformblock1 = loadImage("platformblock_level1_4.png");
  platformblock1.resize(450, 25);

  platformblock2 = loadImage("platformblock4_2.png");
  platformblock2.resize(50, 50);

  platformblock3 = loadImage("platformblock3_2.png");
  platformblock3.resize(50, 50);

  groundblock1 = loadImage("level1_ground.png");
  groundblock1.resize(500, 50);

  door = loadImage("door1.png");
  door.resize(75, 100);

  //loading objects
  object_normal = loadImage("object_cat_2.png");
  object_normal.resize(objectW, objectH);

  object_left = loadImage("cat_left_2.png");
  object_left.resize(objectW, objectH);

  object_right = loadImage("cat_right_2.png");
  object_right.resize(objectW, objectH);

  coin = loadImage("coin_grey.png");
  coin.resize(coinD, coinD);

  //loading explosion for coins
  for (int i=1; i< poofNF; i++) {
    poofImage[i] = loadImage ("explosion"+i+".png"); 
    poofImage[i].resize(40, 40);
  }
  //turning on coins
  coinReset();

  //loading obstacles
  obstacle_up = loadImage("obstacle_up.png");
  obstacle_up.resize(50, 50);

  obstacle_down = loadImage("obstacle_down.png");
  obstacle_down.resize(50, 50);

  obstacle_left = loadImage("obstacle_left.png");
  obstacle_left.resize(50, 50);

  obstacle_right = loadImage("obstacle_right.png");
  obstacle_right.resize(50, 50);

  //loading RED obstacles
  obstacle_left_red = loadImage("obstacle2_left.png");
  obstacle_left_red.resize(50, 50);

  obstacle_right_red = loadImage("obstacle2_right.png");
  obstacle_right_red.resize(50, 50);
}

////////////////////////////////////////////////////////////////
// Main Program                                               //
////////////////////////////////////////////////////////////////

void draw() {
  println(mouseX + ", " + mouseY);
  textFont(font3);
  soundtrack();
  
  //-------------------------------------------------------
  //SCREEN 1: press key to start
  if (screen == 1) {
    textAlign(CENTER, CENTER);
    textFont(font2);
    textSize(75);
    text("PRESS ANY KEY", width/2, height/2-50);
    text("TO START", width/2, height/2+50);
    
    if (keyPressed) { //go to screen 2 Main Menu
      clear();
      screen = 2;
    }
  }
  //-------------------------------------------------------
  //SCREEN 2: main menu
  if (screen == 2) {
    startMenu();
  }
  //-------------------------------------------------------
  //SCREEN 3: starting tutorial (with controls and rules)
  if (screen == 3) { //starting tutorial
    clear();
    tutorialScreen();
    
    //movement
    moveChar0();
    platformCollisions0();
    
    //obstacles
    moveObstacle();
    obstacleCollisions();
    
    //coins
    coinDraw();
    coinCollision();
    drawExplosion(poofX, poofY);
    resetExplosion();
  }
  //-------------------------------------------------------
  //SCREEN 4: Level 1
  if (screen == 4) {
    clear();

    //shortcut to screen 3
    if (keys[4]) {
      screen = 6;
    }
    //shortcut to screen 2
    if (keys[3]) {
      screen = 5;
    }
    
    redrawGameField1();
    score();
    lives();
    
    moveChar1();
    platformCollisions1();

    moveObstacle();
    obstacleCollisions();
    
    coinDraw();
    coinCollision();
    drawExplosion(poofX, poofY);
    resetExplosion();
  }

  //-------------------------------------------------------
  //SCREEN 5: level 2
  if (screen ==5) {
    clear();
    
    //shortcut to screen 3
    if (keys[4]) {
      screen = 6;
    }

    redrawGameMap2();
    score();
    lives();
    
    //movement
    moveChar2();
    platformCollisions2();
    
    //obstacles
    moveObstacle();
    obstacleCollisions();
    
    //coins
    coinDraw();
    coinCollision();
    drawExplosion(poofX, poofY);
    resetExplosion();
  }
  //-------------------------------------------------------
  //SCREEN 6: level 3
  if (screen == 6) {
    clear();
    redrawGameMap3();
    score();
    lives();

    //movement
    moveChar3();
    platformCollisions3();
    
    //obstacles
    moveObstacle();
    obstacleCollisions();
    
    //coins
    coinDraw();
    coinCollision();
    drawExplosion(poofX, poofY);
    resetExplosion();
  }

  //-------------------------------------------------------
  //SCREEN 7: GAME OVER
  if(screen == 7){
    clear();
    GameOver();
  }
  //-------------------------------------------------------
  //SCREEN 8: WIN GAME
  if(screen ==8){
    clear();
    victoryScreen();
  }
}

void keyPressed() {
  if (key==CODED && keyCode==RIGHT) keys[0]=true;
  if (key==CODED && keyCode==LEFT) keys[1]=true;
  if (key==CODED && keyCode==UP) keys[2]=true;
  if (key=='2') keys[3]=true;
  if (key == '3') keys[4] = true;
}

void keyReleased() {
  if (key==CODED && keyCode==RIGHT) keys[0]=false;
  if (key==CODED && keyCode==LEFT) keys[1]=false;
  if (key==CODED && keyCode==UP) keys[2]=false;
  if (key=='2') keys[3] = false;
  if (key == '3') keys[4] = false;
}

void mouseReleased() {
  change = true;
}
