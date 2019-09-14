class Time {
  int time;
  String period;

  Time(this.time, this.period);

  static List<Time> getPeriods() {
    List<Time> period = [
      new Time(1, "DAY"),
      new Time(7, "WEEK"),
      new Time(30, "MONTH"),
      new Time(365, "YEAR"),
    ];
    return period;
  }


}