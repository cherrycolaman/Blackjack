class Card{
  int suit;
  int rank;
  color c;
  
  Card(int s, int r){
    suit = s;
    rank = r;
  }
  void display(){
    // If the suit is a diamond or a circle, the color is black
    // If triangle or plus symbol, the color is red
    if (suit < 3){
      c = color(255, 0, 0);
    } else {
      c = color(0);
    }
    fill(255);
    rect(170, 150, 230, 250);
    fill(c);
    // If rank is 1, 11, 12, or 13, display the corresponding letter.
    // Otherwise display the rank number
    if (rank == 1){
      text("A", 170, 175);
    } else if (rank == 11){
      text("J", 170, 175);
    } else if (rank == 12){
      text("Q", 170, 175);
    } else if (rank == 13){
      text("K", 170, 175);
    } else {
      text("10", 170, 175);
    }
    // Suit 1 is diamond, suit 2 is circle, suit 3 is triangle, suit 4 is plus symbol
    if (suit == 1){
      quad(200, 200, 180, 220, 200, 240, 220, 220);
    } else if (suit == 2) {
      ellipse(200, 220, 40, 40);
    } else if (suit == 3) {
      triangle(200, 200, 180, 240, 220, 240);
    } else {
      rect(190, 200, 210, 240);
      rect(180, 210, 220, 230);
    }
  }
}
