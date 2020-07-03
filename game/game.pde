void setup(){
  size(700,900);
  noLoop();
}

void startPage(){
  background(255);
  fill(0);
  textSize(35);
  text("Color Matching Game",width/4,height/3);

  int rectW = 200;
  int rectH = 50;
  int rectX = (width/2)-(rectW/2);
  int rectY = height/2;
  
  //call button class
  //fill(#FAFF08);
  //rect( (width/2)-(rectW/2), height/2 , rectW , rectH);
 
  if( mousePressed == true && ((rectX < mouseX && mouseX < rectX+rectW)&&(rectY < mouseY && mouseY < rectY+rectH)) ){
    //next page
  }
}
