import 'package:dio/dio.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/api/v1/auth/login')
  Future<LoginResponseModel> login(@Body() LoginRequestModel request,
      {@DioOptions() Options? options});

  @POST('/api/v1/auth/register')
  Future<void> register(@Body() RegisterRequestModel request,
      {@DioOptions() Options? options});

  @POST('/api/v1/auth/refreshToken')
  Future<RefreshTokenResponseModel> refreshToken(
      @Body() RefreshTokenRequestModel request,
      {@DioOptions() Options? options});
}
