class Card {
  int x, y;
  color cardColor, table, back;
  boolean cardClicked = false;

  Card(int x0, int y0) {
    x = x0;
    y = y0;
  }

  void display() {
    fill(cardColor);
    rect(x, y, 50, 60);
  }
  
  void isInside() {
    if(mouseX >= x && mouseX <= x + 50 && mouseY >= y && mouseY <= y + 60) cardClicked = true;
  }

  void changeColor() {
    isInside();
    if (!cardClicked)cardColor = table;
    else cardColor = back;
  }
}

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
  boolean isClicked() {
    if (mousePressed == true && (( x < mouseX && mouseX < x+w)&&(y < mouseY && mouseY < y+h))) {
      return true;
    } else {
      return false;
    }
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

void startPage() {
  background(255);
  fill(0);
  textSize(35);
  text("Color Matching Game", width/4, height/3);
  b_start.display(255, rectX+50, rectY+40, 35);
  
  if (b_start.isClicked()) {
    change = 1;
  }
}

void finalPage() {
  background(255);
  int nowRec = 0; //now record
  int bestRec = 0; //best record
  fill(0);
  textSize(35);
  displayRecord("now record : "+nowRec+"sec", height/4);
  displayRecord(" your Best : "+bestRec+"sec", height/2);
  b_final.display(255, rectX-15, rectY+270, 35);

  if (b_final.isClicked()) {
    change = 0;
  }
}


Button b_start, b_final;
int rectW = 200;
int rectH = 50;
int rectX = (700/2)-(rectW/2);
int rectY = 900/2;
int change = 0;

void setup() {
  size(700, 900);
  color c = color(#FAFF08);
  b_start = new Button(c, rectX, rectY, rectW, rectH, "START");
  b_final = new Button(c, rectX-30, rectY+225, rectW+80, rectH+20, "One more time");
}

void draw() {
  background(255);
  if (change == 0) {
    startPage();
  } else {
    finalPage();
  }
}