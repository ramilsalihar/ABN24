// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_sent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageSentModel _$MessageSentModelFromJson(Map<String, dynamic> json) =>
    MessageSentModel(
      id: json['id'] as int,
      sender_id: json['sender_id'] as String,
      date: json['date'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$MessageSentModelToJson(MessageSentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.sender_id,
      'date': instance.date,
      'text': instance.text,
    };
