class MatchStats {
  final double oversBowled;
  final int totalRuns;
  final int targetScore;
  final double targetOvers;
  final String currentInningNo;
  final String currentBattingTeam;
  final String matchStatus;
  final int totalWicket;
  final String currentBowlingTeam;

  MatchStats({
    required this.oversBowled,
    required this.totalRuns,
    required this.targetScore,
    required this.targetOvers,
    required this.currentInningNo,
    required this.currentBattingTeam,
    required this.matchStatus,
    required this.totalWicket,
    required this.currentBowlingTeam,
  });

  // 🔹 helper: convert overs to balls (e.g. 19.3 -> 117 balls)
  int get ballsBowled {
    return (oversBowled.floor() * 6) +
        ((oversBowled - oversBowled.floor()) * 10).toInt();
  }

  // 🔹 helper: total balls in match
  int get totalBalls => targetOvers.floor() * 6;

  // 🔹 helper: balls remaining
  int get ballsRemaining => totalBalls - ballsBowled;

  // 🔹 helper: runs needed
  int get runsNeeded => targetScore - totalRuns;

  // 🔹 Current Run Rate
  String get crr {
    return ballsBowled > 0
        ? (totalRuns / (ballsBowled / 6)).toStringAsFixed(1)
        : "0.0";
  }

  // 🔹 Required Run Rate
  String? get rrr {
    if (targetScore == 0 || runsNeeded <= 0 || ballsRemaining <= 0) return null;

    return (runsNeeded / (ballsRemaining / 6)).toStringAsFixed(1);
  }

  // 🔹 Subtext (Projected / Chase requirement)
  String get subText {
    if (matchStatus != 'Completed') {
      if (currentInningNo == 'Inn1') {
        final projected = (double.parse(crr) * targetOvers).toStringAsFixed(0);
        return 'Projected score as per CRR is $projected';
      } else {
        return '$currentBattingTeam needs $runsNeeded runs from $ballsRemaining balls to win';
      }
    } else {
      if (oversBowled >= targetOvers || totalWicket == 10) {
        return '$currentBowlingTeam Win by ${runsNeeded - 1} Runs';
      } else if (totalRuns >= targetScore) {}
      return '$currentBattingTeam Win by ${10 - totalWicket} Wickets';
    }
  }
}
