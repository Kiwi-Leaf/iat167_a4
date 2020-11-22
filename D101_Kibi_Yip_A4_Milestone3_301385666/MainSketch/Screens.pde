void titleScreen(){
  background(234,182,182);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("this is a title screen.\nPress space to start.",width/2,height/2);
}

void showHUD(){
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("Death Count: "+player.deathCount+"\nScore: "+player.score,10,40);
}

void infoScreen(){
  background(136,240,114);
  textSize(50);
  textAlign(CENTER);
  text("This is the info screen.\nPress space to continue.",width/2,height/2);
}

void endScreen(){
  background(136,240,114);
  textSize(50);
  fill(0);
  textAlign(CENTER);
  text("This is the end screen.",width/2,height/2);
}
