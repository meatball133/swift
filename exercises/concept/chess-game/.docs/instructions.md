# Instructions

As a chess enthusiast, you would like to write your own version of the game.
Yes, there maybe plenty of implementations of chess available online already, but yours will be unique!

You start with implementing a basic movement system for the pieces.

The chess game will be played on a board that is 8 squares wide and 8 squares long.
The squares are identified by a letter and a number.

## 1. Define rank & file range

The game will have to store the ranks of the board.
The ranks are the rows of the board, and are numbered from 1 to 8.

The game will also have to store the files of the board.
The files are the columns of the board and are identified by the letters A to H.

Define the `ranks` and `files` constants that store the range of ranks and files respectively.

```swift
ranks
// Returns 1...8

files
// Returns 'A'...'H'
```

## 2. Check if square is valid

The game will have to check if a square is valid.
A square is valid if the rank and file are within the ranges of the ranks and files.

Define the `isValidSquare(rank:file:)` function that takes the arguments `rank` that holds an `Int` of the rank and `file` that holds a `String` of the file.
The function should return `true` if the rank and file are within the range of ranks and files, and return `false` otherwise.

```swift
isValidSquare(rank: 1, file: "A")
// Returns true
```

## 3. Create move message

The game will have to create a message for a move to say where a player moved to.
The game also has to determine if the move is valid by checking if the file and rank of the square are within the ranges of the files and ranks.

If the move is valid, the message should be: `"Moved to {square}"`
If the move is invalid, the message should be: `"Invalid square"`

Define the `moveMessage(toRank:toFile:)` function that takes the arguments `toRank` that holds an `Int` of the rank tried to be moved to, `toFile` that holds a `String` of the file tried to be moved to.
The function should return the message for the move as a `String`.

```swift
moveMessage(toRank: 1, toFile: "A")
// Returns "Moved to A1"
```
