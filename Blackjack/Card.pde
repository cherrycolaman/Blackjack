class Card{
  int suit;
  int rank;
  color c;
  int value;
  
  Card(int s, int r){
    suit = s;
    rank = r;
    // Card's value is 10 if it is Jack or higher
    if (rank > 9){
      value = 10;
    } else {
      value = rank;
    }
  }
  void display(int x, int y){
    // If the suit is a diamond or a circle, the color is black
    // If triangle or plus symbol, the color is black
    if (suit < 3){
      c = color(255, 0, 0);
    } else {
      c = color(0);
    }
    fill(255);
    rect(x-30, y-50, x+30, y+50);
    fill(c);
    // If rank is 1, 11, 12, or 13, display the corresponding letter.
    // Otherwise display the rank number
    if (rank == 1){
      text("A", x-30, y-25);
    } else if (rank == 11){
      text("J", x-30, y-25);
    } else if (rank == 12){
      text("Q", x-30, y-25);
    } else if (rank == 13){
      text("K", x-30, y-25);
    } else {
      text(rank, x-30, y-25);
    }
    // Suit 1 is diamond, suit 2 is circle, suit 3 is triangle, suit 4 is plus symbol
    if (suit == 1){
      quad(x, y, x-20, y+20, x, y+40, x+20, y+20);
    } else if (suit == 2) {
      ellipse(x, y+20, 40, 40);
    } else if (suit == 3) {
      triangle(x, y, x-20, y+40, x+20, y+40);
    } else {
      rect(x-10, y, x+10, y+40);
      rect(x-20, y+10, x+20, y+30);
    }
  }
}
