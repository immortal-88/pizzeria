// import 'package:dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:retrofit/retrofit.dart';

part 'orders_api.g.dart';

@RestApi()
abstract class OrdersApi {
  factory OrdersApi(Dio dio, {String baseUrl}) = _OrdersApi;

  @POST('/api/v1/orders/create')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<void> createOrder(@Body() Order order,
      {@DioOptions() Options? options});

  @GET('/api/v1/orders/getAll/{userId}')
  Future<List<Order>> getAll(@Path('userId') String userId,
      {@DioOptions() Options? options});
}
