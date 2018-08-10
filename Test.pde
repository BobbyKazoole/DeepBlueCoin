class Card {
  int[] cardValues;
  String name;
  Card(int[] vals, String n) {
    cardValues = vals;
    name = n;
  }
  void changePower(int p) {
    cardValues[0] = p;
  }
}

class RowSpace {
  int xPos;
  int yPos;
  int spaceWidth;
  int spaceHeight;
  int currentPower;
  boolean isPlayer1Space;
  boolean isActive;
  Card card;
  RowSpace(int x, int y, int w, int h, boolean p) {
    xPos = x;
    yPos = y;
    spaceWidth = w;
    spaceHeight = h;
    isPlayer1Space = p;
  }
  void initRowSpace() {
    rect(xPos, yPos, spaceWidth, spaceHeight);
  }
  
  void placeCard(Card c) {
    card = c;
    if (c != null) {
      currentPower = c.cardValues[0];
    }
    else {
      
    }
  }
  void updatePower(int p) {
    if (isActive == true) {
      currentPower = p;
      card.cardValues[0] = p;
    }
  }
}

class HandSpace {
  int xPos;
  int yPos;
  int spaceWidth;
  int spaceHeight;
  int currentPower;
  boolean isPlayer1Space;
  Card card;
  HandSpace (float x, float y, int w, int h, boolean p) {
    xPos = int(x);
    yPos = int(y);
    spaceWidth = w;
    spaceHeight = h;
    isPlayer1Space = p;
  }
  void placeCard(Card c) {
    card = c;
    currentPower = c.cardValues[0];
  }
  void removeCard() {
    card = null;
    currentPower = 0;
  }
  void initHandSpace() {
    rect(xPos, yPos, spaceWidth, spaceHeight);
  }
}
