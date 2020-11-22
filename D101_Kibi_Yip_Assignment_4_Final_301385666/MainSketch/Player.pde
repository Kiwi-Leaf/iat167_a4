class Player extends Characters{
  boolean up=false;
  boolean right=false;
  boolean left=false;
  boolean jump=false;
  //boolean doubleJump=false;
  boolean companion=false;
  int deathCount=0;
  int score=0;
  PImage[] running=new PImage[3];
  PImage standing,jumping,falling,hurt;
  int hurtCountDown=-2;
  

//----------------------------------------------------------------

Player(PVector pos,PVector vel){
  super(pos,vel);
  damp=0.7;
  dim= new PVector(50,75);
  goUp=new PVector(0,-50);
  goLeft= new PVector(-2.5,0);
  goRight=new PVector(2.5,0);
  goDown=new PVector(0,30);
  gravity=new PVector(0,2.2);
  health=3;
  
  for(int i=0;i<running.length;i++){
    running[i]=loadImage("player_run_"+(i+1)+".PNG");
  }
  standing=loadImage("player_stand.PNG");
  jumping=loadImage("player_jump.PNG");
  falling=loadImage("player_fall.PNG");
  hurt=loadImage("player_hit.PNG");
  
}

//----------------------------------------------------------------
void update(){
  if(companion==true){
    goUp.y=-80;
    
  }

  else goUp.y=-50;
  if ((up&&!jump)){
      jump=true;
      accelerate(goUp);
  }

  seeScreenEdge();
  
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
     if (p.touchPlayer(player)){
       
       if(vel.y>0&&jump==true&&pos.y<p.pos.y-p.dim.y/2){
         isOnPlatform(p);
         }   
     
     else {
       
       fall();
     }
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
void seeScreenEdge(){
  if (pos.x-dim.x/2<0){
  pos.x=dim.x/2+1;
  }
  else if(pos.x+dim.x/2>width){
  pos.x=width-dim.x/2-1;
  }
  
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
void drawThis(){
  pushMatrix();
  //fill(150,130,200);
  translate(pos.x,pos.y);
  //rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
  
  if(direction==1){
    scale(-1,1);
  }
  else scale(1,1);
  if(vel.y<0){
    image(jumping,-dim.x/2,-dim.y/2);
  }
  else if(vel.y>0){
    image(falling,-dim.x/2,-dim.y/2);
  }
  else{
    if(left||right){
      if (frameCount%6==0){
    imageIndex++;
      if (imageIndex==running.length){
      imageIndex=0;
      }
  }
  image(running[imageIndex],-dim.x/2,-dim.y/2);
    }
    else{
    image(standing,-dim.x/2,-dim.y/2);
    }
  }
  
  
  popMatrix();
  
  
}
}
