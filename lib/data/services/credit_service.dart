import 'package:get_it/get_it.dart';
import 'package:project_name/domain/models/app_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../domain/models/credit/credit.dart';
import '../../domain/models/credit/credit_request.dart';
import '../../domain/models/credit/credit_status.dart';
import '../../domain/models/credit/income_repayment.dart';

part 'credit_service.g.dart';

@RestApi()
abstract class CreditService {
  factory CreditService(Dio dio) = _CreditService;

  @GET("mobile/comissiontable")
  Future<AppResponse<Credit>> getLoanProducts();

  @GET("mobile/repayment")
  Future<AppResponse<List<IncomeRepayment>>> getRepayment();

  @GET("mobile/reguests")
  Future<AppResponse<List<CreditStatus>>> getRequestsStatus();

  @POST('mobile/credit')
  Future<AppResponse<CreditRequest>> sendCreditRequest({
    @Body() required CreditRequest request,
  });
}
