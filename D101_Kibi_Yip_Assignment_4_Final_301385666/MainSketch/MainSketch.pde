import ddf.minim.*;
Player player;
int gameState=0;
World world;
Companion companion;
final int TITLE=0;
final int LEVEL_ONE=1;
final int LEVEL_TWO=2;
final int LEVEL_THREE=3; 
final int WIN=5;
boolean titleScreen,levelOne,levelTwo,levelThree,ending,infoScreen= false;
boolean playerControl=false;
boolean gameComplete=false;
PFont bell,consolas,calibri;
//PImage orangeGem1,orangeGem2,orangeGem3;
//PImage blueGem1,blueGem2,blueGem3;
//PImage greenGem1,greenGem2,greenGem3;
//PImage endGem1,endGem2,endGem3;
Minim minim;
AudioPlayer titleSong,endGameSong,collectGem,collectGemExtended,butterfly,levelOneBGM,levelTwoBGM,levelThreeBGM;
//----------------------------------------------------------------
/*

*/
//----------------------------------------------------------------
void setup(){
  size(1000,750);
  world= new World();
  minim=new Minim(this);
  consolas=loadFont("Consolas-Bold-48.vlw");
  calibri=loadFont("Calibri-48.vlw");
  collectGem=minim.loadFile("gem sound 1.mp3");
  collectGemExtended=minim.loadFile("gem sound extra.mp3");
  butterfly=minim.loadFile("butterfly.mp3");
  levelOneBGM=minim.loadFile("Level 1.mp3");
  levelTwoBGM=minim.loadFile("Level 2.mp3");
  levelThreeBGM=minim.loadFile("Level 3.mp3");
  endGameSong=minim.loadFile("End song.mp3");
  titleSong=minim.loadFile("Title song.mp3");
  
  //collectGem.setVolume(0.1);
  

  player= new Player(new PVector(30,height/2),new PVector(0,0));
  bell=loadFont("BellMT-48.vlw");
  info=loadImage("info.JPG");
  for (int i=0;i<titleImage.length;i++){
    titleImage[i]=loadImage("title_"+(i+1)+".png");
  }
    for (int i=0;i<titleImageEndBase.length;i++){
    titleImageEndBase[i]=loadImage("title_end_base_"+(i+1)+".PNG");
  }
  for (int i=0;i<titleImageEndTop.length;i++){
    titleImageEndTop[i]=loadImage("title_end_top_"+(i+1)+".PNG");
  }
  for (int i=0;i<endBg.length;i++){
    endBg[i]=loadImage("end_bg_"+(i+1)+".JPG");
  }
}
  
//----------------------------------------------------------------

void draw(){
  //main game
  switch(gameState){
    case 0:
    if(titleScreen==false){
        levelOneBGM.pause();
        levelTwoBGM.pause();
        levelThreeBGM.pause();
        endGameSong.pause();
        titleSong.rewind();
        titleSong.play();
        titleScreen=true;
      
    }
    else{
    titleScreen();
    }
      break;
    case 1:
      if(levelOne==false){
        playerControl=true;
        player.companion=false;
        player.left=false;
        player.right=false;
        titleScreen=false;
        levelTwo=false;
        levelThree=false;
        ending=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        player.health=3;
        world.addWorldOne();
        world.restartPoint();
        levelOne=true;
        levelTwoBGM.pause();
        levelThreeBGM.pause();
        endGameSong.pause();
        titleSong.pause();
        levelOneBGM.rewind();
        levelOneBGM.loop();

      }

      break;
      
    case 2:
      if(levelTwo==false){
        playerControl=true;
        player.companion=false;
        player.left=false;
        player.right=false;
        titleScreen=false;
        levelOne=false;
        levelThree=false;
        ending=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.addWorldTwo();
        world.restartPoint();
        levelOneBGM.pause();
        levelThreeBGM.pause();
        endGameSong.pause();
        titleSong.pause();
        levelTwoBGM.rewind();
        levelTwoBGM.loop();
        levelTwo=true;
      }
      break;
      
    case 3:
      if(levelThree==false){
        playerControl=true;
        player.companion=false;
        player.left=false;
        player.right=false;
        titleScreen=false;
        levelOne=false;
        levelTwo=false;
        ending=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.addWorldThree();
        world.restartPoint();
        levelTwoBGM.pause();
        levelOneBGM.pause();
        endGameSong.pause();
        titleSong.pause();
        levelThreeBGM.rewind();
        levelThreeBGM.loop();
        levelThree=true;
      }
    
      break;
      
    case 4:
    //show control
    infoScreen();
    
      break;
      
    case 5:
    if(ending==false){
        titleScreen=false;
        levelOne=false;
        levelTwo=false;
        levelThree=false;
        
        ending=true;
        levelTwoBGM.pause();
        levelOneBGM.pause();
        levelThreeBGM.pause();
        titleSong.pause();
        endGameSong.rewind();
        endGameSong.loop();
        
    }
    else{
    endScreen();
    if(player.deathCount<=3&&player.score>=800) gameComplete=true;

    playerControl=false;
    }
    
      break;
  }
  
  world.update();
  if (gameState!=0&&gameState!=5&&gameState!=4){
    showHUD();
  }
  
  //if(gameState==1){
  //  levelTwoBGM.pause();
  //  levelOneBGM.play();
  //}
  //else if(gameState==2){
  //  levelOneBGM.pause();
  //  levelTwoBGM.play();
  //}
  //else if(gameState==3){
  //  levelThreeBGM.play();
  //}
  if (player.pos.y+player.dim.y/2>=height){
    world.restartPoint();
    player.deathCount++;
  }
  
  
}
//----------------------------------------------------------------
void keyPressed() {
  if(playerControl==true){
    if (key == CODED) {
      if (keyCode == UP) player.up = true;
      if (keyCode == LEFT){ 
        player.left = true;
        player.direction=1;
        }
      if (keyCode == RIGHT){
        player.right = true;
        player.direction=2;
      }
    }
    
    if (key=='a'||key=='A'){
    player.left = true;
    player.direction=1;
    }
    if (key=='d'||key=='D'){
    player.right = true;
    player.direction=2;
    }
    if  (key== 'w' || key =='W'){
    player.up = true;
    }

  }
  else if(playerControl==false){
    
      if (key==' '){
        if(gameState==0){
          gameState=4;
        }
        else if(gameState==4){
        playerControl=true;
        gameState=1;
        }
        else if(gameState==5){
          levelOne=false;
          levelTwo=false;
          levelThree=false;
          player.deathCount=0;
          player.score=0;
          gameState=0;
          
          
        }
    }
  }
  if (gameComplete==true){
    if (key=='1') gameState=1;
    else if(key=='2') gameState=2;
    else if(key=='3')  gameState=3;
  }
}

void keyReleased() {
  if(playerControl==true){
    if (key == CODED) {
      if (keyCode == UP) player.up = false;
      if (keyCode == LEFT) player.left = false;
      if (keyCode == RIGHT) player.right = false;
    }
        if (key=='a'||key=='A'){
    player.left = false;
    
    }
    if (key=='d'||key=='D'){
    player.right = false;
    
    }
    if  (key== 'w' || key =='W'){
    player.up = false;
    }
  }
}
//----------------------------------------------------------------
