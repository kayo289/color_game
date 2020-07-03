void setup() {
  noLoop();
  size(700, 900);
}

void draw() {
  background(255);
  int nowRec = 0; //now record
  int bestRec = 0; //best record

  int rectX = 200;
  int rectY = 500;
  int rectW = 100;
  int rectH = 30;

  //今回の記録
  displayRecord("now record : "+nowRec+"sec", height/4);

  //最高記録
  displayRecord("your Best : "+bestRec+"sec", height/2);

/*  //bottunClass "one more time"
    if (mouseClicked() && rectX < mouseX && mouseX < rectX+rectW 
    && rectY < mouseY && mouseY < rectY+rectH) {
    //仕様書二枚目の画面に戻る
  } */
}

void displayRecord( String message, float disRectY) {
  //display Box
  fill(136, 136, 136);
  rect(width/4, disRectY, width/2, height/10);

  //display Message
  fill(0);
  textSize(35);
  text(message, width/4+30, disRectY+height/15);
}
