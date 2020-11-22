Player player;
int gameState=0;
World world;
Companion companion;
final int TITLE=0;
final int LEVEL_ONE=1;
final int LEVEL_TWO=2;
final int LEVEL_THREE=3; 
final int WIN=5;
boolean titleScreen,levelOne,levelTwo,levelThree,ending= false;
boolean playerControl=false;
boolean gameComplete=false;
PFont bell;
//----------------------------------------------------------------
/*
It is totally different from the game in assignment 3 as this is a platformer.
It will have power ups instead of leveling up as in assignment 3.
*/
//----------------------------------------------------------------
void setup(){
  size(1000,750);
  world= new World();

  player= new Player(new PVector(30,height/2),new PVector(0,0));
  bell=loadFont("BellMT-48.vlw");
  
}

//----------------------------------------------------------------

void draw(){
  //main game
  switch(gameState){
    case 0:
    titleScreen();
      break;
    case 1:
      if(levelOne==false){
        player.companion=false;
        levelTwo=false;
        levelThree=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        player.health=3;
        world.addWorldOne();
        world.restartPoint();
        levelOne=true;

      }

      break;
      
    case 2:
      if(levelTwo==false){
        player.companion=false;
        levelOne=false;
        levelThree=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.addWorldTwo();
        world.restartPoint();
        levelTwo=true;
      }
      break;
      
    case 3:
      if(levelThree==false){
        player.companion=false;
        levelOne=false;
        levelTwo=false;
        world.removeList();
        world.removeList();
        world.removeList();
        world.removeList();
        world.addWorldThree();
        world.restartPoint();
        levelThree=true;
      }
    
      break;
      
    case 4:
    //show control
    infoScreen();
    
      break;
      
    case 5:
    endScreen();
    
      break;
  }
  
  world.update();
  if (gameState!=0&&gameState!=5){
    showHUD();
  }
  
  
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
      
    }
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
