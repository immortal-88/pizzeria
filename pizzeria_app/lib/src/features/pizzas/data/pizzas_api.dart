import 'package:dio/dio.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:retrofit/retrofit.dart';

part 'pizzas_api.g.dart';

@RestApi()
abstract class PizzasApi {
  factory PizzasApi(Dio dio, {String baseUrl}) = _PizzasApi;

  @GET('/api/v1/pizzas/getAll')
  Future<List<PizzaInfo>> getPizzas({@DioOptions() Options? options});

  @GET('/api/v1/pizzas/getPizza/{id}')
  Future<PizzaInfo> getPizza(@Path() String id,
      {@DioOptions() Options? options});
}
