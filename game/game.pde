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
    text("Color Matching Game", text_x, text_y);
    fill(buttonColor);
    rect(x, y, w, h);
  }
}
void setup(){
  size(500,500);
  noLoop();
}

void draw(){
  background(255);
}
