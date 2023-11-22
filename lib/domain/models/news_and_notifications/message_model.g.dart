// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as int,
      user_id: json['user_id'] as String,
      user_name: json['user_name'] as String,
      date: json['date'] as String,
      text: json['text'] as String,
      feedback_date: json['feedback_date'] as String,
      feedback_text: json['feedback_text'] as String,
      feedback_user: json['feedback_user'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'date': instance.date,
      'text': instance.text,
      'feedback_date': instance.feedback_date,
      'feedback_text': instance.feedback_text,
      'feedback_user': instance.feedback_user,
    };
