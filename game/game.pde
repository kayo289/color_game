class Button{
  int x, y, h, w;
  color buttonColor;
  String msg;
  Button(color col,int xpos,int ypos, int wpos, int hpos,String msgpos){
    buttonColor = col;
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    msg = msgpos;
  }
  void display(int text_x,int text_y, int text_w, int text_h){
    text(msg,text_x,text_y,text_w, text_h);
    fill(buttonColor);
    rect(x,y,w,h);
  }
}

void setup(){
  size(500,500);
  noLoop();
}

void draw(){
  background(255);
  Button testb = new Button(#ff0000,100,100,25,100,"hello world");
  testb.display(110,110,100);
}
