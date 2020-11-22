class Companion extends Characters{
  int initiateTimer=60;
  float angle=0;
  float floatSpeed;
  
//----------------------------------------------------------------
Companion(PVector pos,PVector vel){
  super(pos,vel);
  dim=new PVector(20,20);
}
//----------------------------------------------------------------
void update(){
  if (player.companion==true){
    drawCompanion();
    move();
  }
  else {
    drawCompanionHiding();
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
  fill(244,255,93);
  rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  popMatrix();
}
//----------------------------------------------------------------  
void drawCompanionHiding(){
  fill(277,255,46,180);
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  rect(-25,0,50,-50);
  popMatrix();
  
}
//----------------------------------------------------------------
}
