class Card {
  int x, y,sizeX = 80,sizeY = 120;
  color cardColor, table, back;
  boolean cardClicked = false;
  boolean make_pair  = false;

  Card(int x0, int y0, color col) {
    x = x0;
    y = y0;
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
      isInside(mx,my);
      if (cardClicked) {
        cardColor = table;
        return 1;
      }
        return 0;
      }
    return 0;
  }

  void refreshCard() {
    if (!make_pair) cardColor = back;
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
  void display(color text_color, int text_x, int text_y, int text_w, int text_h, int text_size) {
    fill(text_color);
    textSize(text_size);
    text("Color Matching Game", x, y);
    fill(buttonColor);
    rect(x, y, w, h);
  }
}

Card[] c = new Card[10];

void setup() {
  size(500, 500);
  color ori = color(random(200), random(200), random(200));
  color[] colData = new color[10];
  for (int i = 0; i < colData.length; i += 2) {
    colData[i] = ori + 2400*i;
    colData[i+1] = ori + 2400*i;
  }

  boolean[] used = new boolean[10];
  int cnt = 0, tmp;
  for (int i = 0; i < 3 && cnt < 10; i ++) {
    for (int j = 0; j < 4 && cnt < 10; j ++) {
      do {
        tmp = int(random(10));
      } while (used[tmp]);
      c[cnt] = new Card(36+116*j, 28+148*i, colData[tmp]);
      used[tmp] = true;
      cnt ++;
    }
  }
}

void draw() {
  background(255);

  game_screen();
}

void game_screen() {
  
  int count = 0;
  int[] tmp = new int[2];
  int cardClicked = 0;

  background(255);
  for (int i = 0; i < c.length; i ++) {
    c[i].display();

    if (mousePressed) {
      cardClicked= c[i].changeColor(mouseX, mouseY);
      if (cardClicked == 1) {
        tmp[count] = i;
        count ++;
      }
    }

    if (count == 2) {
      if (c[tmp[0]].table == c[tmp[1]].table) {
        c[tmp[0]].make_pair = true;
        c[tmp[1]].make_pair = true;
      } else {
        c[i].refreshCard();
      }
      count = 0;
    }
  }
}
