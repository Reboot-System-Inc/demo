String intToTimeLeft(double value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = (value - (h * 3600) - (m * 60)).toInt();

  String result = h > 0 ? "${h}h :${m}m :${s}s" : "${m}m :${s}s";

  return result;
}
