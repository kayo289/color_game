class Button {
  int x, y, w, h;
  color buttonColor;
  String msg;

  Button(color col, int xpos, int ypos, int wpos, int hpos, String msgpos) {
    buttonColor = col;
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    msg = msgpos;
  }
  void display(color text_color, int text_x, int text_y, int text_size) {
    fill(buttonColor);
    rect(x, y, w, h);
    fill(text_color);
    textSize(text_size);
    fill(0);
    text(msg, text_x, text_y);
  }
}

Button b_final;

void setup() {
  noLoop();
  size(700, 900);
}

void draw(){
  finalPage();
}

void finalPage() {
  background(255);
  //記録を保存
  int nowRec = 0; //now record
  int bestRec = 0; //best record

  //ボタンの設定
  int rectW = 280;
  int rectH = 70;
  int rectX = width/2 - rectW/2;
  int rectY = 3*height/4;
  color buttonC = color(#FAFF08);
  b_final = new Button(buttonC, rectX, rectY, rectW, rectH, "one more time");


  //今回の記録
  displayRecord("now record : "+nowRec+"sec", height/4);

  //最高記録
  displayRecord(" your Best : "+bestRec+"sec", height/2);

  //もう一度ボタン
  b_final.display(255, rectX+15, rectY+45, 35);

    if (mousePressed == true && rectX < mouseX && mouseX < rectX+rectW 
   && rectY < mouseY && mouseY < rectY+rectH) {
   //仕様書二枚目の画面に戻る
   }
}

void displayRecord( String message, float rectY) {
  int rectX = width/4;
  int rectW = width/2;
  int rectH = height/10;

  //display Box
  fill(136, 136, 136);
  rect(rectX, rectY, rectW, rectH);

  //display Message
  fill(0);
  textSize(35);
  text(message, rectX+30, rectY+height/15);
}
