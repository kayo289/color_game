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

void startPage() {
  int rectX = (width/2)-(rectW/2);
  int rectY = height/2;

  background(255);
  fill(0);
  textSize(35);
  text("Color Matching Game", width/4, height/3);

  b.display(255, rectX+50, rectY+40, 35);

  if ( mousePressed == true && ((rectX < mouseX && mouseX < rectX+rectW)&&(rectY < mouseY && mouseY < rectY+rectH)) ) {
    //next page
  }
}

Button b;
int rectW = 200;
int rectH = 50;

void setup() {
  size(700, 900);
  noLoop();
  int rectX = (width/2)-(rectW/2);
  int rectY = height/2;
  color c = color(#FAFF08);
  b = new Button(c, rectX, rectY, rectW, rectH, "START");
}

void draw() {
  background(255);
  startPage();
}
