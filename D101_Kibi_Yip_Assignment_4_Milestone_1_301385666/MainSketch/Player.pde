class Player extends Characters{
  boolean up=false;
  boolean right=false;
  boolean left=false;
  boolean jump=false;
  boolean doubleJump=false;
  boolean companion=true;
  

//----------------------------------------------------------------

Player(PVector pos,PVector vel){
  super(pos,vel);
  damp=0.7;
  dim= new PVector(35,50);
  goUp=new PVector(0,-50);
  goLeft= new PVector(-3,0);
  goRight=new PVector(3,0);
  gravity=new PVector(0,1.5);
}

//----------------------------------------------------------------
void update(){
  if ((up&&!jump)){
      jump=true;
      accelerate(goUp);
  }

  
  if (left) accelerate(goLeft);
  if (right) accelerate(goRight);
  drawThis();
  move();
  
  if(platform!=null){
    if (!platform.isOn(player)){
      jump=true;
    }
  }
  
 if(jump){
   accelerate(gravity);
   for(int i=0;i<world.platforms.size();i++){
     Platform p= world.platforms.get(i);
     if (p.bump(player)){
       if(vel.y>0){
         isOnPlatform(p);
       }  
     else fall();
     }
   }
 }

}
//----------------------------------------------------------------
void move(){
  pos.add(vel);
  vel.mult(damp);    
   if (pos.y + dim.y/2 > height) {
      pos.y = height - dim.y/2;
      vel.y=0;
    }
}
//----------------------------------------------------------------



//----------------------------------------------------------------
void isOnPlatform(Platform p){
  platform=p;
  pos.y=p.pos.y-dim.y/2-p.dim.y/2;
  jump=false;
  vel.y=0;
}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  fill(150,130,200);
  translate(pos.x,pos.y);
  rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  
  popMatrix();
  
  
}
}
