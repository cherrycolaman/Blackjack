Card card;
void setup(){
  background(0, 180, 0);
  size(400, 400);
  rectMode(CORNERS);
  // First card variable is suit (1 to 4)
  // Second variable is rank (1 to 12, A=1, J=11, Q=12, K=13)
  // Enter any valid number for the suit and rank to see the card
  card = new Card(3, 10);
  textSize(30);
}
void draw(){
  card.display();
}
  
