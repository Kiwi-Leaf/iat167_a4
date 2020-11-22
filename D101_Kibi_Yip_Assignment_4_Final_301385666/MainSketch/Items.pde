class Items{
  PVector pos,dim;
  int value;
  int type;
  boolean isHere=true;
  //type: 1==points,2==powerups,3==finalPoint
  PImage[] activeImage=new PImage[3];
  int imageIndex=0;
  
Items(PVector pos, int value, int type){
    this.pos=pos;
    this.value=value;
    this.type=type;
    
    if (type==1){
      dim=new PVector(20,20);
      for (int i=0;i<activeImage.length;i++){
        if(value<10){
          activeImage[i]=loadImage("blue_"+(i+1)+".png");
        }
        else if(value<=30){
          activeImage[i]=loadImage("green_"+(i+1)+".png");
        }
        else {
          activeImage[i]=loadImage("orange_"+(i+1)+".png");
        }
      }
    }
    else if (type==3){
      dim=new PVector(40,60);
      for (int i=0;i<activeImage.length;i++){
        activeImage[i]=loadImage("end_"+(i+1)+".png");
      }
    }
    
    

  }
//----------------------------------------------------------------  
void update(){
  drawThis();
  touchPlayer();
  
}
//----------------------------------------------------------------
void touchPlayer(){
  if (abs(player.pos.x-(pos.x-player.pos.x))<player.dim.x/2+dim.x/2&&abs(player.pos.y-pos.y)<player.dim.y/2+dim.y/2){
    world.items.remove(this);
    player.score+=this.value;
    if(type==1){
      collectGem.rewind();
      collectGem.play();
    }
    else{
      collectGemExtended.rewind();
      collectGemExtended.play();
    }
    if (type==3){
      if (gameState<=2){
      gameState+=1;
      world.removeList();
      world.removeList();
      world.removeList();
    }
      else if(gameState==3){
        gameState=5;
        world.removeList();
        world.removeList();
        world.removeList();
        playerControl=false;
      }
    }
    
  }
  
}
//----------------------------------------------------------------
void drawThis(){
  pushMatrix();
  translate(pos.x-player.pos.x,pos.y);
  if (type==1) fill(36,196,36);//green
  else if(type==3) fill(218,63,250);//purple
  else fill(63,230,250);//blue/cyan
  if (type==1&&value>5){
    scale(float(value)/50+1);
  }
  else {scale(1);}
  
  //rect(-dim.x/2,-dim.y/2,dim.x,dim.y);
    if (frameCount%15==0){
    imageIndex++;
      if (imageIndex==activeImage.length){
      imageIndex=0;
      }
  }
  
  image(activeImage[imageIndex],-dim.x/2,-dim.y/2);
  popMatrix();
}
//----------------------------------------------------------------

//----------------------------------------------------------------
}
