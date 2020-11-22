class ShooterEnemy extends BasicEnemy{
  int attackTimer=30;
  PImage[] idleEnemy=new PImage[2];
  PImage[] angryEnemy=new PImage[2];
  PImage[] activeImage;
  
  
//----------------------------------------------------------------
ShooterEnemy(PVector pos, PVector vel){
  super(pos,vel);
  this.dim=new PVector(50,50);
    for(int i=0;i<idleEnemy.length;i++){
    idleEnemy[i]=loadImage("skull_green_"+(i+1)+".png");
  }
    for(int i=0;i<angryEnemy.length;i++){
    angryEnemy[i]=loadImage("skull_red_"+(i+1)+".png");
  }
 
}
//----------------------------------------------------------------
void update(){
  if (pos.x-player.pos.x>player.pos.x){
    direction=1;
  }
  else direction=2;
  
  super.update();
  attack();
  
}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  
  translate(pos.x-player.pos.x,pos.y);
  if(direction==2){
    scale(-1,1);
  }
  else scale(1,1);
  //fill(121,41,39,50);//red
  //rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  if (frameCount%10==0){
    imageIndex++;
      if (imageIndex==idleEnemy.length){
      imageIndex=0;
      }
   }
   if (abs(player.pos.x-(pos.x-player.pos.x))<=300&&(abs(player.pos.y-pos.y)<=200)){
     image(angryEnemy[imageIndex],-dim.x/2,-dim.y/2);
   }
   
   else{
     image(idleEnemy[imageIndex],-dim.x/2,-dim.y/2);
   }
   
  popMatrix();
  
}
//----------------------------------------------------------------
void attack(){

 
  if (abs(player.pos.x-(pos.x-player.pos.x))<=300&&(abs(player.pos.y-pos.y)<=200)){
    attackTimer--;
    
    if (attackTimer<=0){
      world.bullets.add(new Projectile(new PVector(pos.x,pos.y),new PVector(4,0),direction));
      attackTimer=60;
      
    }
    
  }
  else {
    attackTimer=30;
    
  }
  
  
  
}
//----------------------------------------------------------------

}
