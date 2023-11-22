import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final int id;
  final String user_id;
  final String user_name;
  final String date;
  final String text;
  final String feedback_date;
  final String feedback_text;
  final String feedback_user;

  MessageModel({
    required this.id,
    required this.user_id,
    required this.user_name,
    required this.date,
    required this.text,
    required this.feedback_date,
    required this.feedback_text,
    required this.feedback_user,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
