part of 'notifications_cubit.dart';

class NotificationStateData {
  final List<MessageModel>? messages;
  final List<NewsModel>? news;

  NotificationStateData({
    this.messages,
    this.news,
  });
}

@immutable
class NotificationState {
  late final NotificationStateData data;
  late final NotificationsEvent eventState;

  NotificationState({
    required this.data,
    required this.eventState,
  });

  NotificationState.initial() {
    data = NotificationStateData();
    eventState = NotificationsInitial();
  }
}

abstract class NotificationsEvent {}

class NotificationsInitial extends NotificationsEvent {}

class NotificationsLoading extends NotificationsEvent {}

class NotificationsLoaded extends NotificationsEvent {}

class NotificationsError extends NotificationsEvent {
  final String message;

  NotificationsError(this.message);
}

class SendingMessageState extends NotificationsEvent {}

class MessageSentState extends NotificationsEvent {}

class MessageErrorState extends NotificationsEvent {
  final String message;

  MessageErrorState(this.message);
}
