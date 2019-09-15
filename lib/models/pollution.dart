class PollutionLevel {
  int level;
  String name;


  PollutionLevel(this.level, this.name);

  static List<PollutionLevel> getPollutionLevel() {
    List<PollutionLevel> pollution = [
      new PollutionLevel(1, "Madness (beach)"),
      new PollutionLevel(2, "Very High (park)"),
      new PollutionLevel(3, "High (big city)"),
      new PollutionLevel(4, "Medium (small city)")
    ];
    return pollution;
  }


}