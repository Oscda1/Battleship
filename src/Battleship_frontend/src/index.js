// JavaScript 
import { Battleship } from "/home/karsam/Battleship/src/Battleship_backend/main.mo";

const boardEl = document.getElementById("board");
const messageEl = document.getElementById("messages");

// render board 
function renderBoard() {
  // loop through board and render squares
}

// handler for firing button click
const fireButton = document.getElementById("fire-button");
fireButton.onclick = async () => {

  const x = document.getElementById("guess-x").value;
  const y = document.getElementById("guess-y").value;

  const result = await Battleship.makeMove(x, y);
  
  messageEl.innerText = result;

  // check for win
  if (await Battleship.checkSunk()) {
    messageEl.innerText = "You sank all the ships, you win!";
  }

};

// initial render
renderBoard();