class Report {
  final int temp;
  final String wax;
  final String line;
  final String timeStamp;

  Report(this.temp, this.wax, this.line, this.timeStamp);

  Report.fromJson(Map<String, dynamic> parsedJson)
      : temp = parsedJson['temp'],
        wax = parsedJson['wax'],
        line = parsedJson['line'],
        timeStamp = parsedJson['timeStamp'];
}
