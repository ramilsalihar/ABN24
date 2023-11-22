import 'package:json_annotation/json_annotation.dart';

part 'message_sent_model.g.dart';

@JsonSerializable()
class MessageSentModel {
  final int id;
  final String sender_id;
  final String date;
  final String text;

  MessageSentModel({
    required this.id,
    required this.sender_id,
    required this.date,
    required this.text,
  });

  factory MessageSentModel.fromJson(Map<String, dynamic> json) =>
      _$MessageSentModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageSentModelToJson(this);
}
