import 'package:dio/dio.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi()
abstract class ProfileApi {
  factory ProfileApi(Dio dio, {String baseUrl}) = _ProfileApi;

  @GET('/api/v1/user/profile')
  Future<UserLoginModel> getProfile({@DioOptions() Options? options});
}
