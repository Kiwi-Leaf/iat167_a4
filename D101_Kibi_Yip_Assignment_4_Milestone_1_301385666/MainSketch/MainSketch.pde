Player player;
int gameState=1;
World test,leveOne,levelTwo,levelThree,world;
final int TITLE=0;
final int LEVEL_ONE=1;
final int LEVEL_TWO=2;
final int LEVEL_THREE=3;
final int WIN=5;
//----------------------------------------------------------------
/*
It is totally different from the game in assignment 3 as this is a platformer.
It will have power ups instead of leveling up as in assignment 3.
*/
//----------------------------------------------------------------
void setup(){
  size(1000,750);
  world= new World(gameState);

  player=new Player(new PVector(30,height/2),new PVector(0,0));
  player.jump=true;
  
}

//----------------------------------------------------------------

void draw(){
  world.drawLevelOne();
  
  
}
//----------------------------------------------------------------
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) player.up = true;
    if (keyCode == LEFT) player.left = true;
    if (keyCode == RIGHT) player.right = true;
  }
}
//void keyTyped(){
//  if (key == ' ') {
//     player.up=true;
//  }
//}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) player.up = false;
    if (keyCode == LEFT) player.left = false;
    if (keyCode == RIGHT) player.right = false;
  }
}
//----------------------------------------------------------------
