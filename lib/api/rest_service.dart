import 'package:dio/dio.dart';
import 'package:flutter_meal_app/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'constants.dart';

part 'rest_service.g.dart';

@singleton
@RestApi(baseUrl: Constants.BASE_URL)
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @factoryMethod
  static RestService create() {
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    return RestService(dio);
  }

  @POST('/accounts:signUp?key={authKey}')
  Future<User> signup(
      @Path('authKey') String authKey, @Body() Map<String, dynamic> body);

  @POST('/accounts:signInWithPassword?key={authKey}')
  Future<User> login(
      @Path('authKey') String authKey, @Body() Map<String, dynamic> body);
}