// I think I have set up the array properly now.
Deck cards;
void setup(){
  background(0, 180, 0);
  size(400, 400);
  rectMode(CORNERS);
  textSize(30);
  // Deck is created and shuffled
  cards = new Deck();
  cards.shuffle();
}
// The card in position 1 is displayed for now
void draw(){
  cards.deck[1].display(90, 300);
  cards.deck[2].display(160, 300);
  fill(255);
  text(cards.deck[1].value + cards.deck[2].value, 10, 260);
}
  
