
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_app/core/networking/models/weather_output_model.dart';
import '/core/networking/api_constants.dart';
import 'models/five_days_weather_data_model.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @POST(ApiConstants.endPoint)
  Future<WeatherOutputModel> getWeather(
    @Query("q") String city,
    @Query("lang") String lang,
    @Query("appid") String apiKey,
  );

  @POST(ApiConstants.forecast)
  Future<FiveDaysWeatherDataModel> getFiveDaysWeatherData(
    @Query("q") String city,
    @Query("lang") String lang,
    @Query("appid") String apiKey,
  );

  /// auth
  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  // @POST(ApiConstants.logout)
  // Future<LoginResponse> logout();
}
