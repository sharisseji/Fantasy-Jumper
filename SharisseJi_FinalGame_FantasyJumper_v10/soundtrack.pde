void soundtrack(){
  if(screen != 1 && screen != 7 && screen != 8){
    if (!gameMusic.isPlaying()) {
      gameMusic.rewind();
      gameMusic.play();
    }
  }
  else{
    gameMusic.pause();
  }
}
