import 'dart:math';

double roundDouble(double value, int places) {
  final double mod = pow(10.0, places) as double;
  return (value * mod).round().toDouble() / mod;
}

String proportionToPercentString(double proportion, {int places = 1}) {
  return '${roundDouble(proportion * 100, places).toString()}%';
}
