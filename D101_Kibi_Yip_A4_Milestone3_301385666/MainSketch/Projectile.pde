class Projectile{
  PVector pos, vel,dim;
  float decay;
  int direction;
//----------------------------------------------------------------
Projectile(PVector pos, PVector vel,int direction){
  this.pos=pos;
  this.vel=vel;
  dim=new PVector(20,20);
  decay=120;
  this.direction=direction;
}
//----------------------------------------------------------------
void update(){
  drawThis();
  decay--;
  touchPlayer();
 
  
  if (decay>=0){
    move();
  }
  
  else{
    world.bullets.remove(this);
  }
  
}
//----------------------------------------------------------------
void move(){
  if (direction==1){
    pos.sub(vel);
  }
  else pos.add(vel);
  
}
//----------------------------------------------------------------
void touchPlayer(){
  if (abs(player.pos.x-(pos.x-player.pos.x))<=player.dim.x/2+dim.x/2&&(abs(player.pos.y-pos.y)<=player.dim.y/2+dim.y/2)){
    world.bullets.remove(this);
    world.restartPoint();
    player.deathCount++;
  }


  
}
//----------------------------------------------------------------

void drawThis(){
  pushMatrix();
  fill(121,41,39);
  translate(pos.x-player.pos.x,pos.y);
  ellipse(0,0,dim.x,dim.y);
  
  popMatrix();
  
}
//----------------------------------------------------------------
}
