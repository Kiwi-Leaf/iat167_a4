class World{
  ArrayList<Platform> platforms=new ArrayList<Platform>();
  ArrayList<Items> items=new ArrayList<Items>();
  ArrayList<BasicEnemy> enemies= new ArrayList<BasicEnemy>();
  ArrayList<Projectile> bullets=new ArrayList<Projectile>();
  PVector companionLocation;
  PImage bg;
  
  
//----------------------------------------------------------------
World(){

}
//----------------------------------------------------------------
void update(){
  if(gameState>0&&gameState<=3){
  background(200);
  theBackground();

  
  for (int i=0;i<platforms.size();i++){
    platforms.get(i).update();
  }
  
  for (int i=0; i<items.size();i++){
    items.get(i).update();
  }
  
  companion.update();
  
  for(int i=0;i<enemies.size();i++){
    enemies.get(i).update();
  }
  
  for (int i=0;i<bullets.size();i++){
    bullets.get(i).update();
  }
  
  if(dist(player.pos.x,player.pos.y,companion.pos.x-player.pos.x,companion.pos.y)<=player.dim.x/2+companion.dim.x)
  {
    if(player.companion==false){
    butterfly.play(0);
    }
    player.companion=true;

  }
  player.update();
  }
}
//----------------------------------------------------------------

//----------------------------------------------------------------
void removeList(){
  for (int i =0;i<platforms.size();i++){
    platforms.remove(i);
  }
  for (int j =0;j<items.size();j++){
    items.remove(j);
  }
  for(int i=0;i<enemies.size();i++){
    enemies.remove(i);
  }
  for (int i=0;i<bullets.size();i++){
    bullets.remove(i);
  }
}
//----------------------------------------------------------------  
void addWorldOne(){
    platforms.add(new Platform(new PVector(200,height),new PVector(400,200)));
    platforms.add(new Platform(new PVector(250,height-50),new PVector(100,200)));
    platforms.add(new Platform(new PVector(450,height-80),new PVector(150,200)));
    platforms.add(new Platform(new PVector(700,height-130),new PVector(100,300)));
    platforms.add(new Platform(new PVector(1550,height-150),new PVector(1200,300)));
    platforms.add(new Platform(new PVector(1200,height/2-120),new PVector(250,50)));
    platforms.add(new Platform(new PVector(1500,height/2-130),new PVector(400,50)));
    platforms.add(new Platform(new PVector(1800,height/2-140),new PVector(400,50)));
    platforms.add(new Platform(new PVector(650,height/2-150),new PVector(150,50)));
    platforms.add(new Platform(new PVector(500,height/2-160),new PVector(150,50)));
    platforms.add(new Platform(new PVector(330,height/2-180),new PVector(210,60)));
    platforms.add(new Platform(new PVector(100,height/2-160),new PVector(250,100)));
    
    items.add(new Items(new PVector(100,height-200),5,1));
    items.add(new Items(new PVector(140,height-250),5,1));
    items.add(new Items(new PVector(180,height-250),5,1));
    items.add(new Items(new PVector(220,height-220),5,1));
    
    items.add(new Items(new PVector(300,height-230),5,1));
    items.add(new Items(new PVector(340,height-260),5,1));
    items.add(new Items(new PVector(400,height-260),5,1));
    items.add(new Items(new PVector(440,height-220),5,1));
    
    items.add(new Items(new PVector(600,height-350),5,1));
    items.add(new Items(new PVector(640,height-330),5,1));
    items.add(new Items(new PVector(680,height-300),5,1));
    
    items.add(new Items(new PVector(1200,height-330),5,1));
    items.add(new Items(new PVector(1270,height-330),5,1));
    items.add(new Items(new PVector(1340,height-330),5,1));
    items.add(new Items(new PVector(1410,height-330),5,1));
    items.add(new Items(new PVector(1480,height-330),5,1));
    items.add(new Items(new PVector(1550,height-330),5,1));
    items.add(new Items(new PVector(1620,height-330),5,1));
    
    items.add(new Items(new PVector(1000,height-330),5,1));
    items.add(new Items(new PVector(1000,height-380),5,1));
    items.add(new Items(new PVector(1000,height-430),5,1));
    items.add(new Items(new PVector(1000,height-480),5,1));
    items.add(new Items(new PVector(1000,height-530),5,1));
    items.add(new Items(new PVector(1000,height-580),5,1));
    
    items.add(new Items(new PVector(1300,height-580),5,1));
    items.add(new Items(new PVector(1370,height-580),5,1));
    items.add(new Items(new PVector(1440,height-580),5,1));
    items.add(new Items(new PVector(1510,height-580),5,1));
    items.add(new Items(new PVector(1580,height-580),5,1));
    items.add(new Items(new PVector(1650,height-580),5,1));
    items.add(new Items(new PVector(1720,height-580),5,1));
    
    items.add(new Items(new PVector(700,height-580),5,1));
    items.add(new Items(new PVector(650,height-580),5,1));
    items.add(new Items(new PVector(550,height-590),5,1));
    items.add(new Items(new PVector(500,height-590),5,1));
    items.add(new Items(new PVector(300,height-610),5,1));
    items.add(new Items(new PVector(250,height-610),5,1));
    items.add(new Items(new PVector(200,height-610),5,1));
    items.add(new Items(new PVector(100,height-620),100,3));
    enemies.add(new BasicEnemy(new PVector(1200,height-545),new PVector(0,0)));
    enemies.add(new ShooterEnemy(new PVector(390,height-610),new PVector(0,0)));
    bg=loadImage("levelOne_bg_edited.jpg");
    //bg=loadImage("levelOne_bg.PNG");
    companionLocation();
}
//----------------------------------------------------------------  
void addWorldTwo(){
  
  platforms.add(new Platform(new PVector(200,height),new PVector(400,200)));
  platforms.add(new Platform(new PVector(500,height-100),new PVector(400,200)));
  platforms.add(new Platform(new PVector(800,height-200),new PVector(400,200)));
  platforms.add(new Platform(new PVector(1100,height-300),new PVector(400,200)));
  platforms.add(new Platform(new PVector(1400,height-430),new PVector(400,200)));
  platforms.add(new Platform(new PVector(1800,height-470),new PVector(400,200)));
  
  platforms.add(new Platform(new PVector(100,height-600),new PVector(200,50)));
  platforms.add(new Platform(new PVector(250,height-560),new PVector(200,50)));
  platforms.add(new Platform(new PVector(540,height-540),new PVector(100,25)));
  platforms.add(new Platform(new PVector(100,height-400),new PVector(300,40)));
  
  items.add(new Items(new PVector(350,height-230),5,1));
  items.add(new Items(new PVector(400,height-230),5,1));
  items.add(new Items(new PVector(450,height-230),5,1));
  items.add(new Items(new PVector(650,height-330),5,1));
  items.add(new Items(new PVector(700,height-330),5,1));
  items.add(new Items(new PVector(750,height-330),5,1));
  items.add(new Items(new PVector(950,height-430),5,1));
  items.add(new Items(new PVector(1000,height-430),5,1));
  items.add(new Items(new PVector(1050,height-430),5,1));
  items.add(new Items(new PVector(1250,height-560),5,1));
  items.add(new Items(new PVector(1300,height-560),5,1));
  items.add(new Items(new PVector(1350,height-560),5,1));
  items.add(new Items(new PVector(1400,height-560),5,1));
  items.add(new Items(new PVector(1550,height-560),20,1));
  items.add(new Items(new PVector(1650,height-590),5,1));
  items.add(new Items(new PVector(1700,height-590),5,1));
  items.add(new Items(new PVector(1750,height-590),5,1));
  items.add(new Items(new PVector(1900,height-600),30,1));
  items.add(new Items(new PVector(200,height-450),5,1));
  items.add(new Items(new PVector(150,height-450),5,1));
  items.add(new Items(new PVector(90,height-460),50,1));
  items.add(new Items(new PVector(570,height-580),5,1));
  items.add(new Items(new PVector(520,height-580),5,1));
  items.add(new Items(new PVector(300,height-610),5,1));
  items.add(new Items(new PVector(250,height-610),5,1));
  items.add(new Items(new PVector(150,height-650),5,1));
  items.add(new Items(new PVector(90,height-670),100,3));
  
  enemies.add(new BasicEnemy(new PVector(250,height-125),new PVector(0,0)));
  enemies.add(new ShooterEnemy(new PVector(550,height-225),new PVector(0,0)));
  enemies.add(new BasicEnemy(new PVector(850,height-325),new PVector(0,0)));
  enemies.add(new BasicEnemy(new PVector(1150,height-425),new PVector(0,0)));
  enemies.add(new ShooterEnemy(new PVector(1475,height-555),new PVector(0,0)));
  
  bg=loadImage("levelTwo_bg.JPG");



  companionLocation();
  
}
//----------------------------------------------------------------  
void addWorldThree(){
  platforms.add(new Platform(new PVector(200,height),new PVector(400,200)));
  platforms.add(new Platform(new PVector(500,height-150),new PVector(100,40)));
  platforms.add(new Platform(new PVector(600,height-250),new PVector(100,40)));
  platforms.add(new Platform(new PVector(400,height-350),new PVector(100,40)));
  platforms.add(new Platform(new PVector(300,height-450),new PVector(100,40)));
  platforms.add(new Platform(new PVector(100,height-550),new PVector(200,40)));
  platforms.add(new Platform(new PVector(120,height-710),new PVector(100,40)));
  platforms.add(new Platform(new PVector(700,height-550),new PVector(100,40)));
  platforms.add(new Platform(new PVector(900,height-650),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1050,height-500),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1200,height-300),new PVector(100,40)));
  platforms.add(new Platform(new PVector(700,height-100),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1350,height-450),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1500,height-550),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1700,height-550),new PVector(100,40)));
  
  platforms.add(new Platform(new PVector(1400,height-150),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1550,height-350),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1700,height-250),new PVector(100,40)));
  platforms.add(new Platform(new PVector(1900,height-150),new PVector(200,100)));
  platforms.add(new Platform(new PVector(1950,height-550),new PVector(200,100)));
  
  items.add(new Items(new PVector(500,height-200),5,1));
  items.add(new Items(new PVector(600,height-300),5,1));
  items.add(new Items(new PVector(430,height-390),5,1));
  items.add(new Items(new PVector(380,height-390),5,1));
  items.add(new Items(new PVector(330,height-490),5,1));
  items.add(new Items(new PVector(280,height-490),5,1));
  items.add(new Items(new PVector(150,height-600),5,1));
  items.add(new Items(new PVector(100,height-600),5,1));
  items.add(new Items(new PVector(40,height-600),20,1));
  items.add(new Items(new PVector(700,height-150),20,1));
  
  items.add(new Items(new PVector(380,height-530),5,1));
  items.add(new Items(new PVector(410,height-560),5,1));
  
  items.add(new Items(new PVector(680,height-600),5,1));
  items.add(new Items(new PVector(730,height-600),5,1));
  items.add(new Items(new PVector(870,height-700),5,1));
  items.add(new Items(new PVector(920,height-700),5,1));
  items.add(new Items(new PVector(1030,height-550),5,1));
  items.add(new Items(new PVector(1070,height-550),5,1));
  items.add(new Items(new PVector(1180,height-340),5,1));
  items.add(new Items(new PVector(1230,height-340),5,1));
  items.add(new Items(new PVector(1500,height-600),20,1));
  
  items.add(new Items(new PVector(1520,height-400),5,1));
  items.add(new Items(new PVector(1570,height-400),5,1));
  
  items.add(new Items(new PVector(1680,height-300),5,1));
  items.add(new Items(new PVector(1730,height-300),5,1));
  items.add(new Items(new PVector(1850,height-230),5,1));
  items.add(new Items(new PVector(1900,height-230),5,1));
  items.add(new Items(new PVector(1950,height-240),40,1));
  items.add(new Items(new PVector(120,height-750),30,1));
  items.add(new Items(new PVector(1950,height-640),100,3));
  
  
  enemies.add(new BasicEnemy(new PVector(250,height-125),new PVector(0,0)));
  enemies.add(new ShooterEnemy(new PVector(1400,height-195),new PVector(0,0)));
  enemies.add(new ShooterEnemy(new PVector(1350,height-495),new PVector(0,0)));
  enemies.add(new BasicEnemy(new PVector(1700,height-595),new PVector(0,0)));
  
  bg=loadImage("levelThree_bg.JPG");
  
  companionLocation();
  
}
//----------------------------------------------------------------  
void companionLocation(){
  if (gameState==1){
    companion=new Companion(new PVector(1800,height-330),new PVector (0,0));
  }
  else if (gameState==2){
    companion=new Companion(new PVector(1800,height-600),new PVector (0,0));
  }
  else if(gameState==3){
    companion=new Companion(new PVector(500,height-580),new PVector (0,0));
  }
  
}
//----------------------------------------------------------------
void restartPoint(){
   //if (gameState==1){
    player.pos.x=30;
    player.pos.y=height/2;
    player.jump=true;
  //}
}
//----------------------------------------------------------------  
void theBackground(){
  pushMatrix();
  translate(-10-player.pos.x/5,0);
  image(bg,0,0);
  popMatrix();
}
//----------------------------------------------------------------  
}
