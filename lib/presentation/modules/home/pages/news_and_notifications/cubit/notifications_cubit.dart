import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/services/notifications_service.dart';
import '../../../../../../domain/models/news_and_notifications/message_model.dart';
import '../../../../../../domain/models/news_and_notifications/message_sent_model.dart';
import '../../../../../../domain/models/news_and_notifications/news_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationState> {
  NotificationsCubit() : super(NotificationState.initial());

  final _newsService = NotificationsService(GetIt.I.get<Dio>());

  Future<void> getNews() async {
    emit(
      NotificationState(
        data: NotificationStateData(news: state.data.news),
        eventState: NotificationsLoading(),
      ),
    );

    try {
      final response = await _newsService.getNews();

      final news = response.data.map((e) => NewsModel.fromJson(e)).toList();

      emit(
        NotificationState(
          data: NotificationStateData(news: news),
          eventState: NotificationsLoaded(),
        ),
      );
    } catch (error) {
      emit(
        NotificationState(
          data: NotificationStateData(news: state.data.news),
          eventState: NotificationsError(error.toString()),
        ),
      );
    }
  }

  Future<void> getMessages() async {
    emit(
      NotificationState(
        data: NotificationStateData(messages: state.data.messages),
        eventState: NotificationsLoading(),
      ),
    );

    try {
      final response = await _newsService.getMessages();

      final messages =
          response.data.map((e) => MessageModel.fromJson(e)).toList();

      emit(
        NotificationState(
          data: NotificationStateData(messages: messages),
          eventState: NotificationsLoaded(),
        ),
      );
    } catch (error) {
      emit(
        NotificationState(
          data: NotificationStateData(messages: state.data.messages),
          eventState: NotificationsError(error.toString()),
        ),
      );
    }
  }

  Future<void> sendMessage(MessageSentModel message) async {
    emit(
      NotificationState(
        data: NotificationStateData(messages: state.data.messages),
        eventState: SendingMessageState(),
      ),
    );

    try {
      await _newsService.sendMessage(MessageSentModel(
        id: message.id,
        sender_id: message.sender_id,
        date: DateTime.now().toString(),
        text: message.text,
      ));
    } catch (error) {
      emit(
        NotificationState(
          data: NotificationStateData(messages: state.data.messages),
          eventState: MessageErrorState(error.toString()),
        ),
      );
    }
  }
}
