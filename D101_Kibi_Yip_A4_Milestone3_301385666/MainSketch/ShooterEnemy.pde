class ShooterEnemy extends BasicEnemy{
  int attackTimer=30;
  
  
//----------------------------------------------------------------
ShooterEnemy(PVector pos, PVector vel){
  super(pos,vel);
  this.dim=new PVector(50,50);
 
}
//----------------------------------------------------------------
void update(){
  super.update();
  attack();
  
}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  fill(121,41,39,50);//red
  rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  popMatrix();
  
}
//----------------------------------------------------------------
void attack(){
  if (abs(player.pos.x-(pos.x-player.pos.x))<=300&&(abs(player.pos.y-pos.y)<=200)){
    attackTimer--;
    
    if (attackTimer<=0){
      world.bullets.add(new Projectile(new PVector(pos.x,pos.y),new PVector(1.5,0),direction));
      attackTimer=120;
      
    }
    
  }
  else attackTimer=120;
  
  
}
//----------------------------------------------------------------

}
