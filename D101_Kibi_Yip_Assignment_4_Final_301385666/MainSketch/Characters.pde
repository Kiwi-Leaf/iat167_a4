class Characters{
  PVector pos, vel,dim,gravity,goLeft,goRight,goUp,goDown;
  float damp;
  boolean jump=false;
  int health, attack;
  int direction=1;
  int imageIndex=0;
  PImage[] activeImage;
  Platform platform=null;
//----------------------------------------------------------------
Characters(PVector pos, PVector vel){
  this.pos=pos;
  this.vel=vel;
  dim= new PVector(50,100);
}

  
//----------------------------------------------------------------
void update(){
  drawThis();
  
  
}
//----------------------------------------------------------------
void move(){
  pos.add(vel);
  if (pos.y + dim.y/2 > height){
      pos.y = height - dim.y/2;
      vel.y=0;
    }
  //vel.mult(damp);
  //if (pos.x<platform.pos.x-platform.pos.x/2||pos.x>platform.pos.x+platform.pos.x/2) vel.x*=1;
  
}
//----------------------------------------------------------------
void accelerate(PVector acc) {
    vel.add(acc);
  }
//----------------------------------------------------------------
void isOnPlatform(Platform p){
  platform=p;
  if(pos.y+dim.y/2>=p.pos.y-p.dim.y/2){
  pos.y=p.pos.y-dim.y/2-p.dim.y/2;
  jump=false;
  vel.y=0;
  }
}
//----------------------------------------------------------------
void fall(){
  if (vel.y<0)
      vel.y*=-1;
 
}
//----------------------------------------------------------------

//----------------------------------------------------------------
void edgeDetect(){
  
  
}
//----------------------------------------------------------------
void isDead(){
  
}
//----------------------------------------------------------------
void collisionDetect(){
  
}
//----------------------------------------------------------------
void hit(){
  
}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  translate(pos.x,pos.y);
  rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  popMatrix();
}
  
  
}
