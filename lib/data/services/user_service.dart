import 'dart:io';

import 'package:dio/dio.dart';
import 'package:project_name/domain/models/app_response.dart';
import 'package:project_name/domain/models/registration/confirm_sms_data.dart';
import 'package:project_name/domain/models/registration/register_phone_number_data.dart';
import 'package:project_name/domain/models/registration/signup_data.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/authorization/login_data.dart';
import '../../domain/models/user.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @POST('mobile/registration/')
  Future<RegisterPhoneNumberData> registerPhoneNumber({
    @Field('phone_number') required String phoneNumber,
  });

  @POST('mobile/smsconfirm/')
  Future<ConfirmSmsData> confirmSms({
    @Field('sms') required String sms,
  });

  @POST('mobile/signup/')
  Future<SignupData> signup({
    @Field('inn') required String inn,
    @Field('password') required String password,
    @Field('password_confirm') required String password_confirm,
  });

  @POST('mobile/signin/')
  Future<LoginData> login({
    @Field('inn') required String inn,
    @Field('password') required String password,
  });

  @GET('mobile/profile')
  Future<UserResponse<UserData>> getProfileData();

  @FormUrlEncoded()
  @POST('mobile/profile/')
  Future<AppResponse> updateProfile({
    @Body() required UserData userData,
  });
  
  @POST('mobile/files/')
  @MultiPart()
  Future<dynamic> uploadFile({
    @Part() required File file,
    @Part() required int type,
  });
}
