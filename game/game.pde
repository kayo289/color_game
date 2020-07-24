class Card {
  int x, y, sizeX = 80, sizeY = 120;
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
      isInside(mx, my);
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
  void display(color text_color, int text_x, int text_y, int text_w, int text_h, int text_size) {
    fill(text_color);
    textSize(text_size);
    text("Color Matching Game", x, y);
    fill(buttonColor);
    rect(x, y, w, h);
  }
}

Card[] c = new Card[10];
int count = 0;
int[] tmp = new int[2];


void setup() {
  size(500, 500);
  tmp[0] = -1;
  tmp[1] = -1;
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
  background(255);
  for (int i = 0; i < c.length; i ++) {
    c[i].display();

    if (count >= 2) {
      if (c[tmp[0]].table == c[tmp[1]].table) {
        c[tmp[0]].make_pair = true;
        c[tmp[1]].make_pair = true;
      } else {
        int second = 0;
        while(second <= 1000) {
          second ++;
        }
        c[tmp[0]].refreshCard();
        c[tmp[1]].refreshCard();
        println("in");
      }
      count = 0;
      tmp[0] = -1;
      tmp[1] = -1;
    }
  }
  println(count);
}

void mouseClicked() {
  if (count < 2) {
    for (int i = 0; i < c.length; i ++) {
      int cardClicked = 0;

      cardClicked = c[i].changeColor(mouseX, mouseY);
      if (cardClicked == 1) {
        if (count == 1 && tmp[0] != i || count == 0) {
          tmp[count] = i;
          count ++;
        }
        println(tmp[0], tmp[1], count);
      }
    }
  }
}
