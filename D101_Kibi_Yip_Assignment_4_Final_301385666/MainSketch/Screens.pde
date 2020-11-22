PImage[] titleImage=new PImage[4];
PImage[] titleImageEndBase=new PImage[3];
PImage[] titleImageEndTop=new PImage[4];
int titleIndex=0;
int titleEndIndex=0;
int titleEndRate=1;
PImage[] endBg=new PImage[6];
int endIndex=0;
PImage info;

void titleScreen(){
  //print(titleIndex);
  if(gameComplete==false){
  if (frameCount%15==0){
    titleIndex++;
      if (titleIndex==titleImage.length){
      titleIndex=0;
      }
  }
    image(titleImage[titleIndex],0,0);
  }
  else{
   if (frameCount%15==0){
    titleIndex++;
      if (titleIndex==titleImageEndTop.length){
      titleIndex=0;
      }
  }
  titleEndIndex+=titleEndRate;
  if(titleEndIndex<=0||titleEndIndex>=180){
    titleEndRate*=-1;
  }
  if (titleEndIndex<=160)image(titleImageEndBase[0],0,0); 
  else if(titleEndIndex<=175)image(titleImageEndBase[1],0,0); 
  else image(titleImageEndBase[2],0,0); 
  
      image(titleImageEndTop[titleIndex],0,0);
  }

  
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Press space to start.",width/2+70,height/2+200);
  
  textFont(consolas);
  textSize(80);
  text("Journey",width/2+70,height/2);
  textFont(calibri);
}

void showHUD(){
  if(gameState==1){
    fill(196,236,255);
  }
  else{
    fill(0);
  }
  textAlign(LEFT);
  textSize(25);
  text("Death Count: "+player.deathCount+"\nScore: "+player.score,10,40);
}

void infoScreen(){
  //background(136,240,114);
  //textSize(50);
  //textAlign(CENTER);
  //text("This is the info screen.\nPress space to continue.",width/2,height/2);
  image(info,0,0);
}

void endScreen(){
  //background(136,240,114);
  if (frameCount%15==0){
    endIndex++;
      if (endIndex==endBg.length){
      endIndex=0;
      }
  }
    image(endBg[endIndex],0,0);
  fill(0,150);
  rect(50,50,width-100,height-100);
  textSize(50);
  fill(169,236,255);
  textAlign(CENTER);
  text("You Complete the Game",width/2,height/2-250);
  textSize(30);
  text("You used "+player.deathCount+" lives to complete this journey.",width/2,height/2-100);
  text("Your final score is "+player.score+".",width/2,height/2-60);
  if(gameComplete==true){
    text("Now you can navigate between levels with 1, 2,or 3 keys.",width/2,height/2+40);
  }
  else{
    text("Try to complete the game using less than 4 lives and obtain",width/2,height/2+40);
    text(" more than 800 score to unlock extra features.",width/2,height/2+80);
  }
  textSize(20);
  text("Press Space to return to title screen",width/2,height-150);
}
