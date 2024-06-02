import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/azkar_screen/data/data_base/provider/notifications_provider.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/allah_names_screen.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/notifications_settings.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/splash_screen.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/zekr_screen.dart';
import 'package:weather_app/features/home_screen/business_logic/cubit/home_screen_cubit.dart';
import 'package:weather_app/features/home_screen/presentation/screen/home_screen.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'features/azkar_screen/presentation/screen/azkar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(ChangeNotifierProvider<NotificationsProvider>.value(
    value: NotificationsProvider(),
    builder: (ctx, _) => AzkarApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class AzkarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        builder: (ctx, child) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                child: child!,
                value: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarDividerColor: Colors.grey,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              ));
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: SplashScreen(),
        routes: {
          ZekrScreen.routeName: (_) => ZekrScreen(),
          HomeScreen.routeName: (_) => BlocProvider(
                create: (context) => getIt<HomeScreenCubit>()
                  ..getWeather(cityName: "Cairo")
                  ..getFiveDaysWeatherData(cityName: "Cairo")
                  ..getListOfWeatherData(),
                child: HomeScreen(),
              ),
          AzkarScreen.routeName: (_) => AzkarScreen(),
          AllahNamesScreen.routeName: (_) => AllahNamesScreen(),
          NotificationsSettings.routeName: (_) => NotificationsSettings(),
        },
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//   setupGetIt();
//   runApp(WeatherApp());
// }
//
// class WeatherApp extends StatelessWidget {
//
//   const WeatherApp({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(412, 892),
//       minTextAdapt: true,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // home: BlocProvider(
//         //   create: (context) => getIt<HomeScreenCubit>()..getWeather(cityName: "Cairo")..getFiveDaysWeatherData(cityName: "Cairo")..getListOfWeatherData(),
//         //   child: const HomeScreen(),
//         // ),
//       ),
//     );
//   }
// }
