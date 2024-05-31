import 'package:weather_app/core/networking/models/five_days_weather_data_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/models/weather_output_model.dart';
import '../../../../core/networking/web_services.dart';

class GetWeatherRepository{
 final WebServices webServices;

  GetWeatherRepository({required this.webServices});

  Future<ApiResult<WeatherOutputModel>> getWeather({required String cityName,}) async {
    try {
      final response = await webServices.getWeather(cityName,"ar","b02af426a3fad0d92d3e0b32f9324cf0");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<FiveDaysWeatherDataModel>> getFiveDaysWeatherData({required String cityName,}) async {
    try {
      final response = await webServices.getFiveDaysWeatherData(cityName,"ar","b02af426a3fad0d92d3e0b32f9324cf0");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}