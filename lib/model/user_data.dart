class UserData {
  final String nickname;
  final List<int> treesId;
  final int badgeCount;
  final double co2Avoided;
  final double userProgress;

  UserData(
    this.nickname,
    this.treesId,
    this.badgeCount,
    this.co2Avoided,
    this.userProgress,
  );

  int getTreesCount() {
    return treesId.length;
  }
}
