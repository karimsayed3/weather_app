import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home_screen/business_logic/cubit/home_screen_cubit.dart';

class ChangeHomeScreenStates extends StatefulWidget {
  const ChangeHomeScreenStates({super.key});

  @override
  State<ChangeHomeScreenStates> createState() => _ChangeHomeScreenStatesState();
}

class _ChangeHomeScreenStatesState extends State<ChangeHomeScreenStates> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // state.whenOrNull(
        //   getWeatherDataSuccess: (weather) {
        //     HomeScreenCubit.get(context).changeData(weatherData: weather);
        //     // HomeScreenCubit.get(context).weather = weather;
        //   },
        // );
      },
      child: const SizedBox.shrink(),
    );
  }
}
