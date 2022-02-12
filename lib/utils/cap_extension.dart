extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.toUpperCase()).join(" ");

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get toTitleCase => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.capitalize()).join(" ");

  String get toSpace => replaceAllMapped(
      RegExp(r'(?<=[a-z])[A-Z]'), (Match m) => (' ' + m.group(0).toString())).capitalize();

  String get toUnderscore => replaceAllMapped(
      RegExp(r'(?<=[a-z])[A-Z]'), (Match m) => ('_' + m.group(0).toString()));

  String get toKebab => replaceAllMapped(
      RegExp(r'(?<=[a-z])[A-Z]'), (Match m) => ('-' + m.group(0).toString()));
}
