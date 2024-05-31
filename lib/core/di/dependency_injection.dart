import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home_screen/business_logic/cubit/home_screen_cubit.dart';
import 'package:weather_app/features/home_screen/data/repository/repository.dart';
import '/core/networking/web_services.dart';
import '../networking/dio_factory/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WebServices>(() => WebServices(dio));


  getIt.registerLazySingleton<GetWeatherRepository>(() => GetWeatherRepository(webServices: getIt()));
  getIt.registerFactory<HomeScreenCubit>(() => HomeScreenCubit(getIt()));
  //  // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}