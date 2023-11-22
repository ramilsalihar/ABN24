import 'package:project_name/domain/models/app_response.dart';
import 'package:project_name/domain/models/news_and_notifications/message_sent_model.dart';
import 'package:project_name/domain/models/news_and_notifications/news_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../domain/models/news_and_notifications/message_model.dart';

part 'notifications_service.g.dart';

@RestApi()
abstract class NotificationsService {
  factory NotificationsService(Dio dio) = _NotificationsService;

  @GET('mobile/news/')
  Future<AppResponse<NewsModel>> getNews();

  @GET('mobile/message/')
  Future<AppResponse<MessageModel>> getMessages();

  @POST('mobile/message/')
  Future<AppResponse<MessageSentModel>> sendMessage(@Body() MessageSentModel message);
}
