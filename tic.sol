// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract TicTacToe {
  function isSolved(int[3][3] memory board) public pure returns (int) {
    string memory a = "e"; // Initialize string a
    string memory b = "e"; // Initialize string b
    bool emp = true; // Initialize emp flag

    for (uint i = 0; i < 3; i++) {
        // Check rows
        if (board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
            if (board[i][0] == 1) a = "X";
            else if (board[i][0] == 2) b = "0";
        }
        if (board[i][0] != 0 || board[i][1] != 0 || board[i][2] != 0) emp = false; // Update emp flag
    }

    // Check columns
    for (uint j = 0; j < 3; j++) {
        if (board[0][j] == board[1][j] && board[1][j] == board[2][j]) {
            if (board[0][j] == 1) a = "X";
            else if (board[0][j] == 2) b = "0";
        }
    }

    // Check diagonals
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
        if (board[0][0] == 1) a = "X";
        else if (board[0][0] == 2) b = "0";
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
        if (board[0][2] == 1) a = "X";
        else if (board[0][2] == 2) b = "0";
    }

    if (emp == true) return (0); // Return 0 if the game is a tie
    if (keccak256(abi.encodePacked(a)) == keccak256("e") && keccak256(abi.encodePacked(b)) == keccak256("e")) {
        return -1; // Return -1 if the game is not concluded yet
    }
    if (keccak256(abi.encodePacked(a)) == keccak256("X")) return (1); // Return 1 if "X" wins
    if (keccak256(abi.encodePacked(b)) == keccak256("0")) return (2); // Return 2 if "O" wins
    
    return 5;
}

}
