class Companion extends Characters{
  int initiateTimer=60;
  float angle=0;
  float floatSpeed;
  PImage[] inactive=new PImage[4];
  PImage[] butterfly=new PImage[2];
  PImage[] activeImage;
  int imageIndex2=0;
//----------------------------------------------------------------
Companion(PVector pos,PVector vel){
  super(pos,vel);
  dim=new PVector(20,20);
  for (int i=0;i<inactive.length;i++){
    inactive[i]=loadImage("companion_inactive_"+(i+1)+".PNG");
  }
  for (int i=0;i<butterfly.length;i++){
    butterfly[i]=loadImage("companion_"+(i+1)+".PNG");
  }
  activeImage=inactive;
}
//----------------------------------------------------------------
void update(){
  if (player.companion==true){
    activeImage=butterfly;
    drawCompanion();
    move();
   if(pos.x-player.pos.x>player.pos.x){
      direction=1;
    }
    else direction=2;
  }
  else {
    drawCompanionHiding();
    activeImage=inactive;

  }
}
//----------------------------------------------------------------
void move(){
  
  angle = atan2((player.pos.y-player.dim.y/4)- pos.y, player.pos.x-(pos.x-player.pos.x));
  vel = PVector.fromAngle(angle);
  floatSpeed= (dist(player.pos.x,player.pos.y,pos.x-player.pos.x,pos.y))/50*3;
  //if (pos.x-player.pos.x>player.pos.x){
  //  floatSpeed=map(pos.x-player.pos.x,player.pos.x+player.dim.x+dim.x,width,0,30);
  //}
  //else{
  //  floatSpeed=map(pos.x-player.pos.x,player.pos.x-player.dim.x-dim.x,width,0,-30);
  //}
  vel.mult(floatSpeed);
  if (dist(player.pos.x,player.pos.y-player.dim.y/2,pos.x-player.pos.x,pos.y)>player.dim.x+dim.x){
  pos.add(vel);
  }

}
//----------------------------------------------------------------

//----------------------------------------------------------------
void drawCompanion(){
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  //fill(244,255,93);
  //rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  if (direction==2){
    scale(-1,1);
  }
  
  else scale(1,1);
  if (frameCount%10==0){
    imageIndex++;
      if (imageIndex>=activeImage.length){
      imageIndex=0;
      }
  }
  image(activeImage[imageIndex],-dim.x/2,-dim.y/2);
  popMatrix();
}
//----------------------------------------------------------------  
void drawCompanionHiding(){
  //fill(277,255,46,180);
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  //rect(-25,0,50,-50);
  if (frameCount%15==0){
    imageIndex2++;
      if (imageIndex2>=activeImage.length){
      imageIndex2=0;
      }
  }
  image(activeImage[imageIndex2],-25,-25);
  popMatrix();
  
}
//----------------------------------------------------------------
}
