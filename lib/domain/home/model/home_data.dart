// // ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  final List<String> sliders;

  const HomeData({
    required this.sliders,
  });

  factory HomeData.init() => const HomeData(
        sliders: [],
      );

  HomeData copyWith({
    List<String>? sliders,
  }) {
    return HomeData(
      sliders: sliders ?? this.sliders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sliders': sliders,
    };
  }

  factory HomeData.fromMap(Map<String, dynamic> map) {
    return HomeData(
      sliders: List<String>.from(map['sliders'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeData.fromJson(String source) =>
      HomeData.fromMap(json.decode(source));

  @override
  String toString() => 'HomeData(sliders: $sliders)';

  @override
  List<Object> get props => [sliders];
}
