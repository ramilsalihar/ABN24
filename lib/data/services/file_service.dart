import 'dart:io';
import 'package:project_name/domain/models/app_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'file_service.g.dart';

@RestApi()
abstract class FileService {
  factory FileService(Dio dio) = _FileService;

  @POST('mobile/files/')
  @MultiPart()
  Future<AppResponse> uploadFile({
    @Header('token') required String token,
    @Header('type') required int type,
    @Part() required File file,
  });
}
