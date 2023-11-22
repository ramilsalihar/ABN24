import 'package:project_name/domain/models/app_response.dart';
import 'package:project_name/domain/models/info/info_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'info_service.g.dart';

@RestApi()
abstract class InfoService {
  factory InfoService(Dio dio) = _InfoService;

  @GET('mobile/about')
  Future<AppResponse<Location>> aboutAbn();
  
  @GET('mobile/contact/')
  Future<AppResponse<ContactItem>> getContacts();
  
  @GET('mobile/billing/')
  Future<AppResponse<Account>> getAccountDetails();
  
  @GET('mobile/creditproducts/')
  Future<HttpResponse<String>> getCreditInfo();
}