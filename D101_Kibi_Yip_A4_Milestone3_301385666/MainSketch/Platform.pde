class Platform{
  PVector pos, dim;

//----------------------------------------------------------------  
Platform(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;
  
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
    fill(200,150,150);
    translate(-p.pos.x+pos.x, pos.y);
    rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
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
