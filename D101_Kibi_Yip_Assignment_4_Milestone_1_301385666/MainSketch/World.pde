class World{
  ArrayList<Platform> levelOnePlatforms= new ArrayList<Platform>();
  ArrayList<Platform> levelTwoPlatforms= new ArrayList<Platform>();
  ArrayList<Platform> levelThreePlatforms= new ArrayList<Platform>();
  ArrayList<Platform> platforms=new ArrayList<Platform>();
  
  
//----------------------------------------------------------------
World(int gameState){
  if (gameState==1){
    platforms.add(new Platform(new PVector(200,height),new PVector(400,200)));
    platforms.add(new Platform(new PVector(250,height-50),new PVector(100,200)));
    platforms.add(new Platform(new PVector(450,height-80),new PVector(150,200)));
    platforms.add(new Platform(new PVector(700,height-130),new PVector(100,300)));
    platforms.add(new Platform(new PVector(1350,height-150),new PVector(900,300)));
    platforms.add(new Platform(new PVector(1200,height/2-120),new PVector(250,50)));
    platforms.add(new Platform(new PVector(650,height/2-150),new PVector(150,50)));
    platforms.add(new Platform(new PVector(500,height/2-160),new PVector(150,50)));
    platforms.add(new Platform(new PVector(330,height/2-180),new PVector(210,60)));
    platforms.add(new Platform(new PVector(100,height/2-160),new PVector(250,100)));
    
  }
}

//----------------------------------------------------------------
void drawLevelOne(){
  background(200);
  player.update();
  for (int i=0;i<platforms.size();i++){
    platforms.get(i).update();
  }

}
void drawTest(){

}
//----------------------------------------------------------------  
}
