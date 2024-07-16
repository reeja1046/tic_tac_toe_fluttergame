class Game {
  bool ohTurn = true; // first will be O.
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  void tapped(int index, Function(String) showWinnerDialog, Function showDrawDialog) {
    if (ohTurn && displayExOh[index] == '') {
      displayExOh[index] = 'O';
      filledBoxes += 1;
    } else if (!ohTurn && displayExOh[index] == '') {
      displayExOh[index] = 'X';
      filledBoxes += 1;
    }

    ohTurn = !ohTurn;
    checkWinner(showWinnerDialog, showDrawDialog);
  }

  void checkWinner(Function(String) showWinnerDialog, Function showDrawDialog) {
    // Check rows, columns, and diagonals for a winner
    List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var combination in winningCombinations) {
      if (displayExOh[combination[0]] == displayExOh[combination[1]] &&
          displayExOh[combination[0]] == displayExOh[combination[2]] &&
          displayExOh[combination[0]] != '') {
        showWinnerDialog(displayExOh[combination[0]]);
        return;
      }
    }

    // Check for a draw
    if (filledBoxes == 9) {
      showDrawDialog();
    }
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayExOh[i] = '';
    }
    filledBoxes = 0;
  }
}
