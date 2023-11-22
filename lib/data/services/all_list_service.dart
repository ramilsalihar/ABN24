import 'package:project_name/domain/models/app_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../domain/models/all_list/list_model.dart';

part 'all_list_service.g.dart';

@RestApi()
abstract class AllListService {
  factory AllListService(Dio dio) = _AllListService;

  @GET('loan/oblast')
  Future<RefResponse<Oblast>> getOblast();

  @GET('mobile/district/')
  Future<ListResponse<District>> getDistrict({
    @Header('obl_id') required String oblastId,
  });

  @GET('mobile/locality/')
  Future<ListResponse<Locality>> getLocality({
    @Header('raion_id') required String districtId,
  });

  @GET('mobile/marital/')
  Future<AppResponse<MaritalStatus>> getMaritalStatus({
    @Header('sex') required String sex,
  });
}
