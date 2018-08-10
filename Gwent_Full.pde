import java.util.Random;
import java.util.Arrays;
boolean graveyard1Focused = false;
boolean graveyard2Focused = false;
boolean boardFocused = true;
boolean passed1 = false;
boolean passed2 = false;
boolean player1focused = true;
boolean handActive = true;
boolean h1c1 = true;
boolean h1c2 = true;
boolean h1c3 = true;
boolean h1c4 = true;
boolean h1c5 = true;
boolean h1c6 = true;
boolean h1c7 = true;
boolean h1c8 = true;
boolean h1c9 = true;
boolean h1c10 = true;
boolean h2c1 = true;
boolean h2c2 = true;
boolean h2c3 = true;
boolean h2c4 = true;
boolean h2c5 = true;
boolean h2c6 = true;
boolean h2c7 = true;
boolean h2c8 = true;
boolean h2c9 = true;
boolean h2c10 = true;
int activeCardInHand;
boolean[] rowSpacesState = {false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false, false,
                            false, false, false, false, false, false, false, false, false};

//----------------------cards------------------------------

int[] guardArray = {4, 0, 1}; 
Card guard = new Card(guardArray, "Mahakam Guard");
int[] defenderArray = {6, 0, 2};
Card defender = new Card(defenderArray, "Mahakam Defender");
int[] skirmisherArray = {6, 0, 3};
Card skirmisher = new Card(skirmisherArray, "Dwarven Skirmisher");
int[] geraltArray = {15, 2, 4};
Card geralt = new Card(geraltArray, "Geralt of Rivia");
int[] trissArray = {10, 2, 5};
Card triss = new Card(trissArray, "Triss Merigold");
int[] yarpenArray = {8, 1, 6};
Card yarpen = new Card(yarpenArray, "Yarpen Zigrin");
int[] duduArray = {1, 1, 7};
Card dudu = new Card(duduArray, "Dudu");

//-------------------------------------------------------

Card[] deck = {guard, guard, guard, guard, guard, guard, skirmisher, skirmisher, skirmisher, skirmisher, skirmisher, skirmisher, defender, defender, defender, defender, yarpen, yarpen, dudu, dudu, geralt, geralt, triss, triss, skirmisher};
Card[] deck2 = {guard, guard, guard, guard, guard, guard, skirmisher, skirmisher, skirmisher, skirmisher, skirmisher, skirmisher, defender, defender, defender, defender, yarpen, yarpen, dudu, dudu, geralt, geralt, triss, triss, skirmisher};

int[] deckOrder = randomOrder(25);
int[][] boardState = {{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0}, 
                      {0, 0, 0, 0, 0, 0, 0, 0, 0}};
                      
RowSpace[] rowSpaces = new RowSpace[54];
HandSpace[] player1HandSpaces = new HandSpace[10];
HandSpace[] player2HandSpaces = new HandSpace[10];
//Card Array: Power; Rarity (0=bronze, 1=silver, 2=gold); Unique ID
//{Power, Rarity, ID}
PFont cardFont;
void setup() {
  size(1366, 768);
  textFont(createFont("Arial", 25));
  cardFont = createFont("Arial", 15);
  int counter = 0;
  /*
    for (int x = 0; x < 6; x = x+1) {
      for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(x*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(x*(height-250)/6), width/17, (height-250)/6, true);
        if(counter < 27) {
          rowSpaces[counter] = rowp2;
        }
        else {
          rowSpaces[counter] = rowp1;
        }
        //rect(155+(i *(rowWidth/9)), 125+(x*rowHeight), cardWidth, rowHeight);
        //fill(0);
        //text(boardState[x][i], (155+(i *(rowWidth/9)))+2, (125+(x*rowHeight))+22);
        //fill(0, 255, 0, 25);
      }
    }
    */
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(0*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(0*(height-250)/6), width/17, (height-250)/6, true);
        rowSpaces[i] = rowp2;
    }
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(1*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(1*(height-250)/6), width/17, (height-250)/6, true);
        int trueIndex = i+9;
        rowSpaces[trueIndex] = rowp2;
    }
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(2*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(2*(height-250)/6), width/17, (height-250)/6, true);
        int trueIndex = i+18;
        rowSpaces[trueIndex] = rowp2;
    }
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(3*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(3*(height-250)/6), width/17, (height-250)/6, true);
        int trueIndex = i+27;
        rowSpaces[trueIndex] = rowp1;
    }
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(4*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(4*(height-250)/6), width/17, (height-250)/6, true);
        int trueIndex = i+36;
        rowSpaces[trueIndex] = rowp1;
    }
    for (int i = 0; i < 9; i = i+1) {
        RowSpace rowp2 = new RowSpace(155+(i *((width-150)/9)), 125+(5*(height-250)/6), width/17, (height-250)/6, false);
        RowSpace rowp1 = new RowSpace(155+(i *((width-150)/9)), 125+(5*(height-250)/6), width/17, (height-250)/6, true);
        int trueIndex = i+45;
        rowSpaces[trueIndex] = rowp1;
    }
    for (int i = 0; i < 10; i++) {
      HandSpace handp2 = new HandSpace(167.5+(i*((width-300)/10)), 0, width/17, 100, true);
      HandSpace handp1 = new HandSpace(167.5+(i*((width-300)/10)), height-100, width/17, 100, false);
      player1HandSpaces[i] = handp1;
      player2HandSpaces[i] = handp2;
    }
    shuffleArray(deck);
    shuffleArray(deck2);
};
void draw() {
  int cardWidth = width/17;
  int rowHeight = (height-250)/6;
  int rowWidth = width-150;
  int handWidth = width-300;
  if (boardFocused == true) {
    background(255);
    fill(211, 204, 154);
    rect(150, 0, width-300, 100);
    rect(150, height-100, width-300, 100);
    rect(25, height-100, cardWidth, 100);
    rect(width-cardWidth-25, height-100, cardWidth, 100);
    rect(25, 0, width/17, 100);
    rect(width-cardWidth-25, 0, cardWidth, 100);
    rect(125, 125, width-150, height-250);
    ellipse(60, (height/2), 75, 75);
    strokeWeight(2);
    fill(255, 0, 0, 50);
    rect(125, 125, width-150, (height-250)/6);
    rect(125, 125+((height-250)/6), width-150, rowHeight);
    rect(125, 125+(2*rowHeight), width-150, rowHeight);
    fill(0, 0, 255, 50);
    rect(125, 125+(3*rowHeight), width-150, rowHeight);
    rect(125, 125+(4*rowHeight), width-150, rowHeight);
    rect(125, 125+(5*rowHeight), width-150, rowHeight);
    strokeWeight(1);
    fill(0, 255, 0, 25);
    for(int i = 0; i < rowSpaces.length; i++) {
      try {
        rowSpaces[i].initRowSpace();
      } catch (NullPointerException e) {
        e.printStackTrace();
      }
    }
    for (int x = 0; x < 10; x++) {
      try {
        player1HandSpaces[x].initHandSpace();
        player2HandSpaces[x].initHandSpace();
       // rect(167.5+(x*(handWidth/10)), 0, cardWidth, 100);
       // rect(167.5+(x*(handWidth/10)), height-100, cardWidth, 100);
      } catch (NullPointerException e) {
        e.printStackTrace();
      }
    }
    if(h1c1 == true) {
      player1HandSpaces[0].placeCard(deck[0]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[0].currentPower);
      text(temp, player1HandSpaces[0].xPos+5, player1HandSpaces[0].yPos+15, player1HandSpaces[0].spaceWidth, player1HandSpaces[0].spaceHeight);
      text(player1HandSpaces[0].card.name, player1HandSpaces[0].xPos+5, player1HandSpaces[0].yPos+50, player1HandSpaces[0].spaceWidth, player1HandSpaces[0].spaceHeight);
    }
    if(h1c2 == true) {
      player1HandSpaces[1].placeCard(deck[1]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[1].currentPower);
      text(temp, player1HandSpaces[1].xPos+5, player1HandSpaces[1].yPos+15, player1HandSpaces[1].spaceWidth, player1HandSpaces[1].spaceHeight);
      text(player1HandSpaces[1].card.name, player1HandSpaces[1].xPos+5, player1HandSpaces[1].yPos+50, player1HandSpaces[1].spaceWidth, player1HandSpaces[1].spaceHeight);
    }
    if(h1c3 == true) {
      player1HandSpaces[2].placeCard(deck[2]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[2].currentPower);
      text(temp, player1HandSpaces[2].xPos+5, player1HandSpaces[2].yPos+15, player1HandSpaces[2].spaceWidth, player1HandSpaces[2].spaceHeight);
      text(player1HandSpaces[2].card.name, player1HandSpaces[2].xPos+5, player1HandSpaces[2].yPos+50, player1HandSpaces[2].spaceWidth, player1HandSpaces[2].spaceHeight);
    }
    if(h1c4 == true) {
      player1HandSpaces[3].placeCard(deck[3]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[3].currentPower);
      text(temp, player1HandSpaces[3].xPos+5, player1HandSpaces[3].yPos+15, player1HandSpaces[3].spaceWidth, player1HandSpaces[3].spaceHeight);
      text(player1HandSpaces[3].card.name, player1HandSpaces[3].xPos+5, player1HandSpaces[3].yPos+50, player1HandSpaces[3].spaceWidth, player1HandSpaces[3].spaceHeight);
    }
    if(h1c5 == true) {
      player1HandSpaces[4].placeCard(deck[4]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[4].currentPower);
      text(temp, player1HandSpaces[4].xPos+5, player1HandSpaces[4].yPos+15, player1HandSpaces[4].spaceWidth, player1HandSpaces[4].spaceHeight);
      text(player1HandSpaces[4].card.name, player1HandSpaces[4].xPos+5, player1HandSpaces[4].yPos+50, player1HandSpaces[4].spaceWidth, player1HandSpaces[4].spaceHeight);
    }
    if(h1c6 == true) {
      player1HandSpaces[5].placeCard(deck[5]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[5].currentPower);
      text(temp, player1HandSpaces[5].xPos+5, player1HandSpaces[5].yPos+15, player1HandSpaces[5].spaceWidth, player1HandSpaces[5].spaceHeight);
      text(player1HandSpaces[5].card.name, player1HandSpaces[5].xPos+5, player1HandSpaces[5].yPos+50, player1HandSpaces[5].spaceWidth, player1HandSpaces[5].spaceHeight);
    }
    if(h1c7 == true) {
      player1HandSpaces[6].placeCard(deck[6]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[6].currentPower);
      text(temp, player1HandSpaces[6].xPos+5, player1HandSpaces[6].yPos+15, player1HandSpaces[6].spaceWidth, player1HandSpaces[6].spaceHeight);
      text(player1HandSpaces[6].card.name, player1HandSpaces[6].xPos+5, player1HandSpaces[6].yPos+50, player1HandSpaces[6].spaceWidth, player1HandSpaces[6].spaceHeight);
    }
    if(h1c8 == true) {
      player1HandSpaces[7].placeCard(deck[7]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[7].currentPower);
      text(temp, player1HandSpaces[7].xPos+5, player1HandSpaces[7].yPos+15, player1HandSpaces[7].spaceWidth, player1HandSpaces[7].spaceHeight);
      text(player1HandSpaces[7].card.name, player1HandSpaces[7].xPos+5, player1HandSpaces[7].yPos+50, player1HandSpaces[7].spaceWidth, player1HandSpaces[7].spaceHeight);
    }
    if(h1c9 == true) {
      player1HandSpaces[8].placeCard(deck[8]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[8].currentPower);
      text(temp, player1HandSpaces[8].xPos+5, player1HandSpaces[8].yPos+15, player1HandSpaces[8].spaceWidth, player1HandSpaces[8].spaceHeight);
      text(player1HandSpaces[8].card.name, player1HandSpaces[8].xPos+5, player1HandSpaces[8].yPos+50, player1HandSpaces[8].spaceWidth, player1HandSpaces[8].spaceHeight);
    }
    if(h1c10 == true) {
      player1HandSpaces[9].placeCard(deck[9]);
      fill(0);
      textFont(cardFont);
      String temp = str(player1HandSpaces[9].currentPower);
      text(temp, player1HandSpaces[9].xPos+5, player1HandSpaces[9].yPos+15, player1HandSpaces[9].spaceWidth, player1HandSpaces[9].spaceHeight);
      text(player1HandSpaces[9].card.name, player1HandSpaces[9].xPos+5, player1HandSpaces[9].yPos+50, player1HandSpaces[9].spaceWidth, player1HandSpaces[9].spaceHeight);
    }
    
    if(h2c1 == true) {
      player2HandSpaces[0].placeCard(deck2[0]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[0].currentPower);
      text(temp, player2HandSpaces[0].xPos+5, player2HandSpaces[0].yPos+15, player2HandSpaces[0].spaceWidth, player2HandSpaces[0].spaceHeight);
      text(player2HandSpaces[0].card.name, player2HandSpaces[0].xPos+5, player2HandSpaces[0].yPos+50, player2HandSpaces[0].spaceWidth, player2HandSpaces[0].spaceHeight);
    }
    if(h2c2 == true) {
      player2HandSpaces[1].placeCard(deck2[1]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[1].currentPower);
      text(temp, player2HandSpaces[1].xPos+5, player2HandSpaces[1].yPos+15, player2HandSpaces[1].spaceWidth, player2HandSpaces[1].spaceHeight);
      text(player2HandSpaces[1].card.name, player2HandSpaces[1].xPos+5, player2HandSpaces[1].yPos+50, player2HandSpaces[1].spaceWidth, player2HandSpaces[1].spaceHeight);
    }
    if(h2c3 == true) {
      player2HandSpaces[2].placeCard(deck2[2]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[2].currentPower);
      text(temp, player2HandSpaces[2].xPos+5, player2HandSpaces[2].yPos+15, player2HandSpaces[2].spaceWidth, player2HandSpaces[2].spaceHeight);
      text(player2HandSpaces[2].card.name, player2HandSpaces[2].xPos+5, player2HandSpaces[2].yPos+50, player2HandSpaces[2].spaceWidth, player2HandSpaces[2].spaceHeight);
    }
    if(h2c4 == true) {
      player2HandSpaces[3].placeCard(deck2[3]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[3].currentPower);
      text(temp, player2HandSpaces[3].xPos+5, player2HandSpaces[3].yPos+15, player2HandSpaces[3].spaceWidth, player2HandSpaces[3].spaceHeight);
      text(player2HandSpaces[3].card.name, player2HandSpaces[3].xPos+5, player2HandSpaces[3].yPos+50, player2HandSpaces[3].spaceWidth, player2HandSpaces[3].spaceHeight);
    }
    if(h2c5 == true) {
      player2HandSpaces[4].placeCard(deck2[4]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[4].currentPower);
      text(temp, player2HandSpaces[4].xPos+5, player2HandSpaces[4].yPos+15, player2HandSpaces[4].spaceWidth, player2HandSpaces[4].spaceHeight);
      text(player2HandSpaces[4].card.name, player2HandSpaces[4].xPos+5, player2HandSpaces[4].yPos+50, player2HandSpaces[4].spaceWidth, player2HandSpaces[4].spaceHeight);
    }
    if(h2c6 == true) {
      player2HandSpaces[5].placeCard(deck2[5]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[5].currentPower);
      text(temp, player2HandSpaces[5].xPos+5, player2HandSpaces[5].yPos+15, player2HandSpaces[5].spaceWidth, player2HandSpaces[5].spaceHeight);
      text(player2HandSpaces[5].card.name, player2HandSpaces[5].xPos+5, player2HandSpaces[5].yPos+50, player2HandSpaces[5].spaceWidth, player2HandSpaces[5].spaceHeight);
    }
    if(h2c7 == true) {
      player2HandSpaces[6].placeCard(deck2[6]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[6].currentPower);
      text(temp, player2HandSpaces[6].xPos+5, player2HandSpaces[6].yPos+15, player2HandSpaces[6].spaceWidth, player2HandSpaces[6].spaceHeight);
      text(player2HandSpaces[6].card.name, player2HandSpaces[6].xPos+5, player2HandSpaces[6].yPos+50, player2HandSpaces[6].spaceWidth, player2HandSpaces[6].spaceHeight);
    }
    if(h2c8 == true) {
      player2HandSpaces[7].placeCard(deck2[7]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[7].currentPower);
      text(temp, player2HandSpaces[7].xPos+5, player2HandSpaces[7].yPos+15, player2HandSpaces[7].spaceWidth, player2HandSpaces[7].spaceHeight);
      text(player2HandSpaces[7].card.name, player2HandSpaces[7].xPos+5, player2HandSpaces[7].yPos+50, player2HandSpaces[7].spaceWidth, player2HandSpaces[7].spaceHeight);
    }
    if(h2c9 == true) {
      player2HandSpaces[8].placeCard(deck2[8]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[8].currentPower);
      text(temp, player2HandSpaces[8].xPos+5, player2HandSpaces[8].yPos+15, player2HandSpaces[8].spaceWidth, player2HandSpaces[8].spaceHeight);
      text(player2HandSpaces[8].card.name, player2HandSpaces[8].xPos+5, player2HandSpaces[8].yPos+50, player2HandSpaces[8].spaceWidth, player2HandSpaces[8].spaceHeight);
    }
    if(h2c10 == true) {
      player2HandSpaces[9].placeCard(deck2[9]);
      fill(0);
      textFont(cardFont);
      String temp = str(player2HandSpaces[9].currentPower);
      text(temp, player2HandSpaces[9].xPos+5, player2HandSpaces[9].yPos+15, player2HandSpaces[9].spaceWidth, player2HandSpaces[9].spaceHeight);
      text(player2HandSpaces[9].card.name, player2HandSpaces[9].xPos+5, player2HandSpaces[9].yPos+50, player2HandSpaces[9].spaceWidth, player2HandSpaces[9].spaceHeight);
    }
    for(int i = 0; i < 54; i++) {
      boolean temp = rowSpacesState[i];
      if (temp == true) {
        fill(0);
        if (rowSpaces[i].card != null) {
          String temp2 = str(rowSpaces[i].card.cardValues[0]);
          text(temp2, rowSpaces[i].xPos+5, rowSpaces[i].yPos+15, rowSpaces[i].spaceWidth, rowSpaces[i].spaceHeight);
          text(rowSpaces[i].card.name, rowSpaces[i].xPos+5, rowSpaces[i].yPos+35, rowSpaces[i].spaceWidth, rowSpaces[i].spaceHeight);
        }
      }
    }
    fill(0, 255, 0, 25);
    
    if(passed1 == true) {
      fill(0, 0, 0, 50);
      rect(150, height-100, width-300, 100);
      fill(0);
    }
    if(passed2 == true) {
      fill(0, 0, 0, 50);
      rect(150, 0, width-300, 100);
      fill(0);
    }
  }
  if (graveyard1Focused == true) {
    background(200, 200, 200);
    for (int x = 0; x < 7; x = x + 1) {
      for (int i = 0; i < 13; i = i + 1) {
        fill(0, 255, 0, 25);
        rect(37.5+(i*(rowWidth/12)), 60+(x*(height/7.5)), width/17, (height-250)/6);
      }
    }
    fill(0);
    text("Graveyard 1", (width/2)-62.5, 40);
  }
  if (graveyard2Focused == true) {
    background(200, 200, 200);
    for (int x = 0; x < 7; x = x + 1) {
      for (int i = 0; i < 13; i = i + 1) {
        fill(0, 255, 0, 25);
        rect(37.5+(i*(rowWidth/12)), 60+(x*(height/7.5)), width/17, (height-250)/6);
      }
    }
    fill(0);
    text("Graveyard 2", (width/2)-62.5, 40);
  }
}/*end of draw*/

void mousePressed() {
  for(int i = 0; i < 10; i++) {
    HandSpace space = player1HandSpaces[i];
    if(mouseX > space.xPos && mouseX < space.xPos + space.spaceWidth && mouseY > space.yPos && mouseY < space.yPos + space.spaceHeight) {
      activeCardInHand = i;
      println(activeCardInHand);
    }
  }
  for(int i = 0; i < 10; i++) {
    HandSpace space = player2HandSpaces[i];
    if(mouseX > space.xPos && mouseX < space.xPos + space.spaceWidth && mouseY > space.yPos && mouseY < space.yPos + space.spaceHeight) {
      activeCardInHand = i;
      println(activeCardInHand);
    }
  }
  for(int i = 0; i < 54; i++) {
    if (mouseX > rowSpaces[i].xPos && mouseX < rowSpaces[i].xPos + rowSpaces[i].spaceWidth && mouseY > rowSpaces[i].yPos && mouseY < rowSpaces[i].yPos + rowSpaces[i].spaceHeight) {
      if(player1focused == false) {
        if(rowSpaces[i].isPlayer1Space == true) {
          if(passed1 == false) {
            rowSpaces[i].placeCard(player1HandSpaces[activeCardInHand].card);
            rowSpacesState[i] = true;
            player1HandSpaces[activeCardInHand].removeCard();
            if (activeCardInHand == 0) {
              h1c1 = false;
            }
            if (activeCardInHand == 1) {
              h1c2 = false;
            }
            if (activeCardInHand == 2) {
              h1c3 = false;
            }
            if (activeCardInHand == 3) {
              h1c4 = false;
            }
            if (activeCardInHand == 4) {
              h1c5 = false;
            }
            if (activeCardInHand == 5) {
              h1c6 = false;
            }
            if (activeCardInHand == 6) {
              h1c7 = false;
            }
            if (activeCardInHand == 7) {
              h1c8 = false;
            }
            if (activeCardInHand == 8) {
              h1c9 = false;
            }
            if (activeCardInHand == 9) {
              h1c10 = false;
            }
          }
        } 
      }
      else {
        if(rowSpaces[i].isPlayer1Space == false) {
          if(passed2 == false) {
            rowSpaces[i].placeCard(player2HandSpaces[activeCardInHand].card);
            rowSpacesState[i] = true;
            player2HandSpaces[activeCardInHand].removeCard();
            if (activeCardInHand == 0) {
              h2c1 = false;
            }
            if (activeCardInHand == 1) {
              h2c2 = false;
            }
            if (activeCardInHand == 2) {
              h2c3 = false;
            }
            if (activeCardInHand == 3) {
              h2c4 = false;
            }
            if (activeCardInHand == 4) {
              h2c5 = false;
            }
            if (activeCardInHand == 5) {
              h2c6 = false;
            }
            if (activeCardInHand == 6) {
              h2c7 = false;
            }
            if (activeCardInHand == 7) {
              h2c8 = false;
            }
            if (activeCardInHand == 8) {
              h2c9 = false;
            }
            if (activeCardInHand == 9) {
              h2c10 = false;
            }
          }
        }
      }
    }
  }
}

void keyPressed() {
  if (key == 'g') {
    if(player1focused == true) {
      showHideGraveyard1();
    }
    else {
      showHideGraveyard2();
    }
  }
  if(key == 'p') {
    if(player1focused == true) {
      pass1();
    }
    else {
      pass2();
    }
  }
  if(key == 'c') {
    changeFocusedPlayer();
  }
  if(key == 's') {
    setupHand();
  }
}

void showHideGraveyard1() {
  if (graveyard1Focused == true) {
    graveyard1Focused = false;
  } else {
    graveyard1Focused = true;
  }
}

void showHideGraveyard2() {
  if (graveyard2Focused == true) {
    graveyard2Focused = false;
  } else {
    graveyard2Focused = true;
  }
}

void pass1() {
  if(passed1 == true) {
    passed1 = false;
  }
  else {
    passed1 = true;
  }
}

void pass2() {
  if(passed2 == true) {
    passed2 = false;
  }
  else {
    passed2 = true;
  }
}

void changeFocusedPlayer() {
  if(player1focused == true) {
    player1focused = false;
  }
  else {
    player1focused = true;
  }
}

void shuffleArray(Card[] array) { 
  Random rng = new Random();
  for (int i = array.length; i > 1; i--) {
    int j = rng.nextInt(i);
    Card tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}

void setupHand() {
  if (player1focused == true) {
    player1HandSpaces[0].placeCard(deck[0]);
    player1HandSpaces[1].placeCard(deck[1]);
    player1HandSpaces[2].placeCard(deck[2]);
    player1HandSpaces[3].placeCard(deck[3]);
    player1HandSpaces[4].placeCard(deck[4]);
    player1HandSpaces[5].placeCard(deck[5]);
    player1HandSpaces[6].placeCard(deck[6]);
    player1HandSpaces[7].placeCard(deck[7]);
    player1HandSpaces[8].placeCard(deck[8]);
    player1HandSpaces[9].placeCard(deck[9]);
  }
  else {
    player2HandSpaces[0].placeCard(deck[0]);
    player2HandSpaces[1].placeCard(deck[1]);
    player2HandSpaces[2].placeCard(deck[2]);
    player2HandSpaces[3].placeCard(deck[3]);
    player2HandSpaces[4].placeCard(deck[4]);
    player2HandSpaces[5].placeCard(deck[5]);
    player2HandSpaces[6].placeCard(deck[6]);
    player2HandSpaces[7].placeCard(deck[7]);
    player2HandSpaces[8].placeCard(deck[8]);
    player2HandSpaces[9].placeCard(deck[9]);
  }
}

int[] randomOrder(int upperBound) {
  IntList randomArray = new IntList();
  for(int i = 0; i < upperBound; i++) {
    int rand = int(random(upperBound));
    while (randomArray.hasValue(rand)) {
      rand = int(random(upperBound));
    }
    randomArray.append(rand);
  }
  int[] randomOutput = randomArray.array();
  for(int i = 0; i < randomOutput.length; i++) {
    randomOutput[i] -= 1;
  }
  return randomOutput;
}

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
