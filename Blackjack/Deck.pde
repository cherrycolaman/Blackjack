class Deck{
  // This will be the array of cards
  Card[] deck;
  // Position will be important for the order of cards
  int position;

  Deck(){
  // A new array of Card objects is created, ignoring spot 0
    deck = new Card[53];
    for (int rank = 1; rank < 14; rank++){
      // First 13 cards are diamonds
      deck[rank] = new Card(1, rank);
      // next is circle cards
      deck[rank + 13] = new Card(2, rank);
      // next is triangle
      deck[rank + 26] = new Card(3, rank);
      // last 13 cards are "+" symbol
      deck[rank + 39] = new Card(4, rank);
    }
    position = 1;
  }
  // Below is the command to shuffle the deck
  void shuffle(){
    for (int i = 1; i < deck.length; i++){
      int randomCard = int(random(52)) + 1;
      // A temp card is used for swapping
      Card temp = deck[i];
      deck[i] = deck[randomCard];
      deck[randomCard] = temp;
    }
  }
}
