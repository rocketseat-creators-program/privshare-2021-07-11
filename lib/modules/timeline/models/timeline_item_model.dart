import 'dart:convert';

class TimelineItemModel {
  final String text;
  final bool isSubscribersOnly;

  TimelineItemModel({
    required this.text,
    required this.isSubscribersOnly,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isSubscribersOnly': isSubscribersOnly,
    };
  }

  factory TimelineItemModel.fromMap(Map<String, dynamic> map) {
    return TimelineItemModel(
      text: map['text'],
      isSubscribersOnly: map['isSubscribersOnly'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TimelineItemModel.fromJson(String source) =>
      TimelineItemModel.fromMap(json.decode(source));
}
