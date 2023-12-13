// Very simple blackjack game I used as an opportunity to make a programmable deck of cards
// Ace cards always have a value of 1

// These are the colours for the buttons that will change when highlighted
color button1;
color button2;
// This next variable is based on how many times the player chooses "HIT"
int hits;
// The sum of the values of each card
int total;
// The sum of the dealer's cards
int dealer;
// The number of dealer hits
int dealerHits;
// This boolean will keep track of when to switch to the dealer drawing cards
boolean stand;
// This boolean keeps tarack of whther the game is over
boolean gameOver;
// Deck is initalized
Deck cards;
// Setup will happen again if the player clicks the screen to reset after winning/losing
void setup(){
  // Framerate reset to 30 (since it changes to 1 when dealer draws cards)
  frameRate(30);
  background(0, 180, 0);
  size(400, 400);
  rectMode(CORNERS);
  textSize(30);
  // Variables are reset to zero
  button1 = color(180, 0, 0);
  button2 = color(180, 0, 0);
  hits = 0;
  dealer = 0;
  dealerHits = 0;
  stand = false;
  gameOver = false;
  // Deck is created and shuffled
  text("SHUFFLING...", 100, 200);
  cards = new Deck();
  cards.shuffle();
  // The player's first cards will be the third and fourth card in the deck, their value is added together
  total = cards.deck[3].value + cards.deck[4].value;
}
void draw(){
  background(0, 180, 0);
  // If the player chose 'stand', then the dealer will start drawing cards.
  // Their second card on the screen is drawn but initially hidden
  if (stand == true){
    // Show progressively more cards of dealer's cards and add to dealer's total based on how many hits they have
    // The cards drawn after the first two are the ones next in the deck after the player chose 'stand'
    // This prevents the dealer from drawing copies of the player's cards
    if (dealerHits == 0){
      dealer = cards.deck[1].value + cards.deck[2].value;
    } else if (dealerHits > 0){
      cards.deck[hits+5].display(230, 120);
      dealer = cards.deck[1].value + cards.deck[2].value + cards.deck[hits+5].value;
      if (dealerHits > 1){
        cards.deck[hits+6].display(300, 120);
        dealer = cards.deck[1].value + cards.deck[2].value + cards.deck[hits+5].value + cards.deck[hits+6].value;
        if (dealerHits > 2){
          cards.deck[hits+7].display(370, 120);
          dealer = cards.deck[1].value + cards.deck[2].value + cards.deck[hits+5].value + cards.deck[hits+6].value + cards.deck[hits+7].value;
        }
        // If somehow the dealer still doesn't reach 17, just ends the game
        if (dealerHits > 3){
          fill(0, 0, 255);
          text("YOU WIN! (Reset)", 140, 200);
          gameOver = true;
        }
      }
    }
  }
  // If the mouse is over a button, the color will change
  if (mouseY>350&&mouseY<390){
    if (mouseX>10&&mouseX<195){
      button1 = color(255, 90, 90);
    } else {
      button1 = color(180, 0, 0);
    }
    if (mouseX>205&&mouseX<390){
      button2 = color(255, 90, 90);
    } else {
      button2 = color(180, 0, 0);
    }
  }
  fill(button1);
  rect(10, 350, 195, 390);
  fill(button2);
  rect(205, 350, 390, 390);
  // The HIT and STAND text on the buttons is in white
  fill(255);
  text("HIT", 80, 380);
  text("STAND", 260, 380);
  cards.deck[1].display(90, 120);
  fill(180, 0, 0);
  // If the player did not stand yet, the dealer's second card is hidden
  if (stand == false){
    rect(130, 70, 190, 170);
  } else {
    // If the player did stand, the dealer's total, and the second card, are displayed
    cards.deck[2].display(160, 120);
    text(dealer, 10, 120);
    // Framerate is set to 1 so the dealer only draws 1 card each second
    frameRate(1);
    // Dealer must draw until 17 or higher. After that, win/lose depending on whether dealer goes past 21 or if dealer's total is less or greater than player's
    // Text color changes depending on win or loss. Either way, game is considered over
    if (dealer<17){
      dealerHits++;
    } else if (dealer>21){
      fill(0, 0, 255);
      text("YOU WIN! (Reset)", 140, 200);
      gameOver = true;
    } else if (dealer<total){
      fill(0, 0, 255);
      text("YOU WIN! (Reset)", 140, 200);
      gameOver = true;
    } else if (dealer==total){
      fill(255, 0, 0);
      text("TIE (Dealer Wins)", 140, 200);
      gameOver = true;
    } else if (dealer>total){
      fill(255, 0, 0);
      text("YOU LOSE! (Reset)", 140, 200);
      gameOver = true;
    }
  }
  // Third and fourth card are the player's, displayed below
  cards.deck[3].display(90, 280);
  cards.deck[4].display(160, 280);
  // As the player hits, the next cards in the deck are displayed and added to their total
  // Cannot hit more than 3 times since there is only limited space to display cards
  if (hits > 0){
    cards.deck[5].display(230, 280);
    total = cards.deck[3].value + cards.deck[4].value + cards.deck[5].value;
    if (hits > 1){
      cards.deck[6].display(300, 280);
      total = cards.deck[3].value + cards.deck[4].value + cards.deck[5].value + cards.deck[6].value;
      if (hits > 2){
        cards.deck[7].display(370, 280);
        total = cards.deck[3].value + cards.deck[4].value + cards.deck[5].value + cards.deck[6].value + cards.deck[7].value;
      }
    }
    // If player's total exceeds 21, they immediately lose
    if (total>21){
      fill(255, 0, 0);
      text("YOU LOSE (Reset)", 140, 200);
      gameOver = true;
    }
  }
  //Player's total is displayed next to their cards
  fill(255);
  stroke(0);
  text(total, 10, 260);
  // Dealer instructions are written in smaller text
  textSize(20);
  text("Dealer will stand on 17 or higher", 60, 40);
  // Text size is reset
  textSize(30);
}
void mousePressed(){
  // Buttons can only be pressed if the game is not over
  if (mouseY>350&&mouseY<390&&gameOver==false){
    // if pressing the left button and did not stand yet, increase number of hits
    if (mouseX>10&&mouseX<195&&stand==false){
      hits++;
    // if pressing the right button, change to 'stand'
    } else if (mouseX>205&&mouseX<390){
      stand = true;
    }
  }
  // If the player clicks the screen after the game ends, it will reset the game
  if (gameOver == true){
    setup();
  }
}
  
