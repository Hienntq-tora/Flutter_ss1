enum Difficulty { beginner, intermediate, advanced }

extension DifficultyX on Difficulty {
  String get toName {
    switch (this) {
      case Difficulty.beginner:
        return "Beginner";
      case Difficulty.intermediate:
        return "Intermediate";
      case Difficulty.advanced:
        return "Advanced";
    }
  }
}
