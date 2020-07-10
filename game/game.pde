
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
  void display(color text_color,int text_x, int text_y, int text_size) {
    fill(text_color);
    textSize(text_size);
    text(msg, text_x, text_y);
    fill(buttonColor);
    rect(x, y, w, h);
  }
}


Card[] c = new Card[10];

void setup() {
  size(500, 500);
  noLoop();
}

void draw(){
  background(255);
}