class Companion extends Characters{
  
//----------------------------------------------------------------
Companion(PVector pos,PVector vel){
  super(pos,vel);
}
//----------------------------------------------------------------
void update(){
  drawCompanion();
}
//----------------------------------------------------------------
void drawCompanion(){
  fill(227,255,46);
  pushMatrix();
  translate(pos.x,pos.y);
  popMatrix();
}
//----------------------------------------------------------------  
}
