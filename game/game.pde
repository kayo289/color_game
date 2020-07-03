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

Card[] c = new Card[10];

void setup() {
  
}

void draw() {
}
