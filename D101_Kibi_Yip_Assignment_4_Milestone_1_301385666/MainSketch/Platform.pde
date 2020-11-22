class Platform{
  PVector pos, dim;
  //float platformWidth, platformHeight;

//----------------------------------------------------------------  
Platform(PVector pos, PVector dim){
  this.pos=pos;
  //this.platformHeight=platformHeight;
  //this.platformWidth=platformWidth;
  this.dim=dim;
  
}
//----------------------------------------------------------------  
void update(){
  drawPlatform(player);
  
  
}
//----------------------------------------------------------------
boolean isOn(Characters c){
  if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2) {
    //if((c.pos.x>= pos.x||c.pos.x<= pos.x+dim.x )&&
    //   (c.pos.y+c.dim.y>=pos.y)){
      return true;
    }
    return false;
  
}
//----------------------------------------------------------------
boolean bump(Characters c){
    if (abs(c.pos.x - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2 &&
      abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
    //if((c.pos.x+c.dim.x/2)>=pos.x||(c.pos.x-c.dim.x<=pos.x+dim.x)){
      return true;
    }
    return false;
  
}
//----------------------------------------------------------------  
void drawPlatform(Player p){
   noStroke();
    pushMatrix();
    //translate(pos.x, pos.y);
    fill(200,150,150);
    translate(-p.pos.x+pos.x, pos.y);
    rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
    //rect(0, 0, dim.x, dim.y);
    popMatrix();
  
}


}
