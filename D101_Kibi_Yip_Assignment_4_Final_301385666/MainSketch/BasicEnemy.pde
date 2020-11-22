class BasicEnemy extends Characters{
  PImage[] activeImage=new PImage[2];
//----------------------------------------------------------------
BasicEnemy(PVector pos,PVector vel){
  super(pos,vel);
  this.dim=new PVector(50,50);
  for (int i=0;i<activeImage.length;i++){
    activeImage[i]=loadImage("Basic_"+(i+1)+".png");
  }
}
//----------------------------------------------------------------
void update(){
  if (player.pos.x<=pos.x-player.pos.x)direction=1;
  else direction=2;
  drawThis();
  if (touchPlayer()){
   
    world.restartPoint();
    player.deathCount++;
    

    
  }

}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  //fill(247,52,52);//red
  //rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
    if (frameCount%60==0){
    imageIndex++;
      if (imageIndex>=activeImage.length){
      imageIndex=0;
      }
  }
  image(activeImage[imageIndex],-dim.x/2,-dim.y/2);
  popMatrix();
  
}
//----------------------------------------------------------------
boolean touchPlayer(){
  if (abs(player.pos.x-(pos.x-player.pos.x))<=player.dim.x/2+dim.x/2&&(abs(player.pos.y-pos.y)<=player.dim.y/2+dim.y/2)){
    return true;
  }
  else return false;
}
//----------------------------------------------------------------
}
