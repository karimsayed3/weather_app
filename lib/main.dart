import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/home_screen/business_logic/cubit/home_screen_cubit.dart';
import 'package:weather_app/features/home_screen/presentation/screen/home_screen.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {

  const WeatherApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => getIt<HomeScreenCubit>()..getWeather(cityName: "Cairo")..getFiveDaysWeatherData(cityName: "Cairo")..getListOfWeatherData(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
