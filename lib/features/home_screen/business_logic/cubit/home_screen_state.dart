part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class GetWeatherDataLoading extends HomeScreenState {}
final class GetWeatherDataSuccess extends HomeScreenState {
  final WeatherOutputModel weather;
  GetWeatherDataSuccess(this.weather);
}
final class GetWeatherDataError extends HomeScreenState {
  final String error;
  GetWeatherDataError(this.error);
}final class GetFiveDaysWeatherDataLoading extends HomeScreenState {}
final class GetFiveDaysWeatherDataSuccess extends HomeScreenState {
  final List<FiveDayData> weather;
  GetFiveDaysWeatherDataSuccess(this.weather);
}
final class GetFiveDaysWeatherDataError extends HomeScreenState {
  final String error;
  GetFiveDaysWeatherDataError(this.error);
}
final class ChangeData extends HomeScreenState {}
final class GetWeatherDataLoadingList extends HomeScreenState {}

class GetWeatherDataSuccessList extends HomeScreenState {
  final List<WeatherOutputModel> weatherList;
  GetWeatherDataSuccessList(this.weatherList);
}

final class GetWeatherDataErrorList extends HomeScreenState {
  final String error;
  GetWeatherDataErrorList(this.error);
}