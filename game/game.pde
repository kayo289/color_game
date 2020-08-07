class Card {
  int x, y, sizeX, sizeY;
  color cardColor, table, back;
  boolean cardClicked = false;
  boolean make_pair  = false;

  Card(int x0, int y0, color col) {
    x = x0;
    y = y0;
    sizeX = width / 4 - 50;
    sizeY = height / 3 - 70;
    table = col;
    back = color(200, 100, 100);
    cardColor = back;
  }

  void display() {
    fill(cardColor);
    rect(x, y, sizeX, sizeY);
  }

  void isInside(int mx, int my) {
    if (mx >= x && mx <= x + sizeX && my >= y && my <= y + sizeY) cardClicked = true;
  }

  int changeColor(int mx, int my) {
    if (!make_pair) {
      isInside(mx, my);
      if (cardClicked) {
        cardColor = table;
        display();
        return 1;
      }
    }
    return 0;
  }

  void refreshCard() {
    if (!make_pair) cardColor = back;
    cardClicked = false;
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

class Timer {
  int start_time;
  int s;
  void begin() {
    int ms = millis()/1000;
    start_time = ms;
    s = 0;
  }
  void done() {
    int ms = millis()/1000;
    s = ms - start_time;
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
    time.begin();
  }
}

int bestRec = 0; //best record
void finalPage() {
  background(255);
  int nowRec = time.s; //now record
  fill(0);
  textSize(35);
  if (bestRec == 0 || nowRec < bestRec) bestRec = nowRec; 

  displayRecord("now record : "+nowRec+"sec", height/4);
  displayRecord(" your Best : "+bestRec+"sec", height/2);
  b_final.display(255, rectX-15, rectY+270, 35);

  if (b_final.isClicked()) {
    change = 0;
    setup();
  }
}


Button b_start, b_final;
int rectW = 200;
int rectH = 50;
int rectX = (700/2)-(rectW/2);
int rectY = 900/2;
int change = 0;
Timer time = new Timer();

Card[] c = new Card[10];
int count = 0;
int[] tmp = new int[2];

void setup() {
  size(700, 850);
  color a = color(#FAFF08);
  b_start = new Button(a, rectX, rectY, rectW, rectH, "START");
  b_final = new Button(a, rectX-30, rectY+225, rectW+80, rectH+20, "One more time");

  tmp[0] = -1;
  tmp[1] = -1;
  color ori = color(random(200), random(200), random(200));
  color[] colData = new color[10];
  for (int i = 0; i < colData.length; i += 2) {
    colData[i] = ori + 1200*i;
    colData[i+1] = ori + 1200*i;
  }

  boolean[] used = new boolean[10];
  int cnt = 0, tmp;
  for (int i = 0; i < 3 && cnt < 10; i ++) {
    for (int j = 0; j < 4 && cnt < 10; j ++) {
      do {
        tmp = int(random(10));
      } while (used[tmp]);
      c[cnt] = new Card(width/4*j+25, height / 3 * i + height / 8, colData[tmp]);
      used[tmp] = true;
      cnt ++;
    }
  }
}

void draw() {
  background(255);
  if (change == 0) {
    startPage();
  } else if (change == 1) {
    game_screen();
  } else {
    finalPage();
  }
}

void game_screen() {

  background(255);
  for (int i = 0; i < c.length; i ++) {
    c[i].display();
    if (count >= 2) {
      if (c[tmp[0]].table == c[tmp[1]].table) {
        c[tmp[0]].make_pair = true;
        c[tmp[1]].make_pair = true;
      } else {
        delay(3000);
        c[tmp[0]].refreshCard();
        c[tmp[1]].refreshCard();
      }
      count = 0;
      tmp[0] = -1;
      tmp[1] = -1;
    }
  }
  int m;
  for (m = 0; m < c.length && c[m].make_pair; m++);
  if (m == c.length) {
    time.done();
    delay(3000);
    change = 2;
  }
}

void mouseClicked() {
  if (change == 1) {
    if (count < 2) {
      for (int i = 0; i < c.length; i ++) {
        int cardClicked = 0;

        cardClicked = c[i].changeColor(mouseX, mouseY);
        if (cardClicked == 1) {
          if (count == 1 && tmp[0] != i || count == 0) {
            tmp[count] = i;
            count ++;
          }
        }
      }
    }
  }
}
