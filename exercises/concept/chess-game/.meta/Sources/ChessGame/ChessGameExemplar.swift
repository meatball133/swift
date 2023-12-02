let ranks = 1...8
let files = "A"..."H"

func isValidSquare(rank: Int, file: String) -> Bool {
  ranks.contains(rank) && files.contains(file)
}

func moveMessage(toRank: Int, toFile: String) -> String {
  if isValidSquare(rank: toRank, file: toFile) {
    return "Moved to \(toFile)\(toRank)"
  }
  return "Invalid square"
}
