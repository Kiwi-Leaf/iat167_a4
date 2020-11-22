class Platform{
  PVector pos, dim;
  PImage platformImage;

//----------------------------------------------------------------  
Platform(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;
  if (gameState==1){
    if (dim.x<250){
      if (dim.x==100) platformImage=loadImage("platform_lv1_100x300.PNG");
      else if (dim.x==150){
        if (dim.y==50)
          platformImage=loadImage("platform_lv1_150x50.PNG");
        else if(dim.y==200) platformImage=loadImage("platform_lv1_150x200.PNG");
      }
      else if(dim.x==210)platformImage=loadImage("platform_lv1_210x60.PNG");
    }
    else{
      if (dim.x==250){
        if(dim.y==50)platformImage=loadImage("platform_lv1_250x50.PNG");
        else if(dim.y==100)platformImage=loadImage("platform_lv1_250x100.PNG");
      }
      else if(dim.x==400){
        
        if(dim.y==50)platformImage=loadImage("platform_lv1_400x50.PNG");
        else if(dim.y==200)platformImage=loadImage("platform_lv1_400x200.PNG");
      }
      else if(dim.x==1200)platformImage=loadImage("platform_lv1_1200x300.PNG");
    }
  }
  else if(gameState==2){
    if(dim.x==100)platformImage=loadImage("platform_lv2_100x25.PNG");
    else if(dim.x==200)platformImage=loadImage("platform_lv2_200x50.PNG");
    else if(dim.x==300)platformImage=loadImage("platform_lv2_300x40.PNG");
    else platformImage=loadImage("platform_lv2_400x200.PNG");
    
  }
  else if(gameState==3){
    if(dim.x==100)platformImage=loadImage("platform_lv3_100x40.PNG");
    else if(dim.x==200)platformImage=loadImage("platform_lv3_200x100.PNG");
    else if(dim.x==400)platformImage=loadImage("platform_lv3_400x200.PNG");
  }
}
//----------------------------------------------------------------  
void update(){
  drawPlatform(player);
  blockPlayer();
  
  
}
//----------------------------------------------------------------
boolean isOn(Characters c){
  if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2) {
      return true;
    }
    return false;
  
}
//----------------------------------------------------------------

//----------------------------------------------------------------  
boolean touchPlayer(Characters c){
  if ((c.pos.x+c.dim.x/2>=(pos.x-dim.x/2)-c.pos.x&&c.pos.x-c.dim.x/2<=(pos.x+dim.x/2)-c.pos.x)&&(c.pos.y+c.dim.y/2>=pos.y-dim.y/2&&c.pos.y-c.dim.y<=pos.y+dim.y/2)) return true;
  else return false;
}
//----------------------------------------------------------------  
void drawPlatform(Player p){
   noStroke();
    pushMatrix();
    //fill(200,150,150);
    translate(-p.pos.x+pos.x, pos.y);
    //rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
    image(platformImage,-dim.x/2,-dim.y/2);
    popMatrix();
  
}
//----------------------------------------------------------------  
void blockPlayer(){
  
  if (player.pos.y>pos.y-dim.y/2&&player.pos.y<pos.y+dim.y/2){
    if(abs(player.pos.x-(pos.x-player.pos.x))<=player.dim.x/2+dim.x/2){
      if (player.pos.x>pos.x-player.pos.x){
        player.pos.x=(pos.x-player.pos.x)+dim.x/2+player.dim.x/2;
      }
      else if(player.pos.x<(pos.x-player.pos.x)){
        player.pos.x=(pos.x-player.pos.x)-dim.x/2-player.dim.x/2;
      }
    }
  }
  
}
//----------------------------------------------------------------  

}
