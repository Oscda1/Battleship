import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

actor Battleship{

  let boardSize = 10;

  let ships = [
    // locations of ships on board
    [[4,1], [4,2], [4,3]], // destroyer
    [[7,5], [7,6], [7,7]], // cruiser
    [[2,9], [3,9], [4,9], [5,9]], // battleship
    [[0,0], [1,0], [2,0], [3,0]], // carrier
  ];

  var guesses : [var Nat] = Array.init(boardSize, 0); // track guesses

  public func makeMove(x : Nat, y : Nat) : async Text {
    let flattenedShips = Array.flatten<[Nat]>(ships);
    if(guesses[x] >= boardSize) {
      return "You already made a guess on that row!";
    };
    guesses[x] += 1; // increment guess count
    let guess = [x, y];
    if (Array.find<[Nat]>(flattenedShips, func(ship){Array.equal<Nat>(ship, guess, func(x, y) { x == y })}) != null) {
      return "Hit!"; 
  } else {
      return "Miss!";
  };
  };

  public query func checkSunk() : async Bool {
    // check if all ships sunk
    var allSunk = true;
    let flattenedShips = Array.flatten(ships);
    for (ship in flattenedShips.vals()) {
      if (guesses[ship[0]] < boardSize) { // ship not fully hit
        allSunk := false;
      };
    };
    return allSunk;
  };

};