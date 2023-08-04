import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String id;
  NotificationModel({
    required this.id,
  });

  NotificationModel copyWith({
    String? id,
  }) {
    return NotificationModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] ?? '',
    );
  }

  @override
  String toString() => 'NotificationModel(id: $id)';

  @override
  List<Object> get props => [id];
}
