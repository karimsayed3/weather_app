import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/networking/api_result.dart';
import 'package:weather_app/core/networking/models/five_days_weather_data_model.dart';
import 'package:weather_app/features/home_screen/data/repository/repository.dart';
import '../../../../core/networking/models/weather_output_model.dart';
import '../../../../core/utils/utils.dart';
import '../../../../model/five_days_data.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  GetWeatherRepository getWeatherRepository;

  HomeScreenCubit(this.getWeatherRepository) : super(HomeScreenInitial());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  // WeatherOutputModel? weather;

  List<String> cities = [
    "cairo",
    "giza",
    "alexandria",
    "minya",
    "aswan",
  ];

  List<WeatherOutputModel>? weatherList;

  List<FiveDayData> fiveDaysData = [];
  WeatherOutputModel? weather;

  Future<void> getWeather({
    required String cityName,
  }) async {
    emit(GetWeatherDataLoading());
    final response = await getWeatherRepository.getWeather(cityName: cityName);
    response.when(success: (data) {
      weather = data;
      emit(GetWeatherDataSuccess(data));
    }, failure: (error) {
      emit(GetWeatherDataError(error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> getFiveDaysWeatherData({
    required String cityName,
  }) async {
    emit(GetFiveDaysWeatherDataLoading());
    final response =
    await getWeatherRepository.getFiveDaysWeatherData(cityName: cityName);
    response.when(success: (data) {
      fiveDaysData.clear();
      for (var element in data.list!) {
        fiveDaysData.add(FiveDayData(
          temp: element.temperature,
          dateTime: changeDateFormat(timestamp: element.dateTimeText),
        ));
      }
      // weather = data;
      emit(GetFiveDaysWeatherDataSuccess(fiveDaysData));
    }, failure: (error) {
      emit(GetFiveDaysWeatherDataError(error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> getListOfWeatherData() async {
    emit(GetWeatherDataLoadingList());
    try {
      // Map the cities to a list of Futures for fetching the weather data
      List<Future<WeatherOutputModel>> futures = cities.map((city) async {
        final response = await getWeatherRepository.getWeather(cityName: city);
        return response.when(
          success: (data) => data,
          failure: (errorHandler) => throw Exception(errorHandler.apiErrorModel.message),
        );
      }).toList();

      // Wait for all the Futures to complete
      weatherList = await Future.wait(futures);
      print(weatherList!.length);
      emit(GetWeatherDataSuccessList(weatherList!));
    } catch (e) {
      emit(GetWeatherDataErrorList(e.toString()));
    }
  }

// changeData({
//   required WeatherOutputModel weatherData,
// }){
//   weather = weatherData;
//   emit(ChangeData());
// }
}