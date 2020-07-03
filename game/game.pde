class Card {
  int x, y;
  color iro, omote, ura;
  boolean cardClicked = false;

  Card(int x0, int y0) {
    x = x0;
    y = y0;
  }

  void display() {
    fill(iro);
    rect(x, y, 50, 60);
  }

  void changeColor() {
    if (!cardClicked)iro = omote;
    else iro = ura;
  }
}

Card[] c = new Card[10];

void setup() {
  
}

void draw() {
}
