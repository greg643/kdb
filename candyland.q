/ Candyland Card Generator

/ A simple project to generate a complete deck of Candyland cards, shuffle them, and call out each card for each player until the deck is complete.


/generate cards

colors:`Purple`Red`Orange`Blue`Green`Yellow;

singles:raze {7#x} each colors;

doubles:raze {2#(enlist x,x)} each colors;

/ I think our deck is already incomplete, so we're adding some extra cards here:
extraCards:(`R,enlist `B`B);

bonus:`GumDrops`GingerBreadMan`CandyHearts`CandyCane`Lollipops`PeanutBrittle`FudgeBar;

fullDeck:singles,doubles,extraCards,bonus;

/ set players and draw order

players:`Player1`Player2`Player3`Player4;

N:count players; D:count fullDeck; randPlayers:(-1*N)?players; 

playOrder:("j"$(D-(D mod N)))#randPlayers;

/ function to deal

draw:{ $[(curVal>=(count shuffled))|(curVal>=(count playOrder));`$"time to reshuffle!";[shuf:shuffled[curVal]; curPlayer:playOrder[curVal]; curVal :: curVal+1; enlist `$((string curPlayer), " - ", (raze string  shuf), "       (card#:", (string curVal-1), ")") ]] };

/ shuffle deck and initialize count

shuffled:-63?fullDeck; curVal:0; `$"reshuffled and ready to play!"

/ play the game!

draw[]

