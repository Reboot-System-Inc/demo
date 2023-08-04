part of 'extensions.dart';

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join(' ');

  List<String> iterable() {
    List<String> items = [];
    split("").forEach((item) => items.add(item));
    return items;
  }

  String toWordTitleCase() {
    return iterable()
        .map((e) {
          if (e == e.toUpperCase()) {
            return " $e";
          } else {
            return e;
          }
        })
        .toList()
        .join('')
        .trim()
        .split(' ')
        .map((str) => str.toCapitalize())
        .join(' ');
  }
}
