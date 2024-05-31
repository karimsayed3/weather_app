import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/home_screen/presentation/widgets/search_widget.dart';
import '../../../../core/networking/models/weather_output_model.dart';
import '../../../../model/five_days_data.dart';
import '../../../../widget/myList.dart';
import '../../../../widget/my_chart.dart';
import '../../business_logic/cubit/home_screen_cubit.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherOutputModel weather = WeatherOutputModel();
  List<WeatherOutputModel> weatherList = [];
  List<FiveDayData> fiveDaysData = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SearchWidget(),
                      BlocConsumer<HomeScreenCubit, HomeScreenState>(
                        listener: (context, state) {
                          if (state is GetWeatherDataSuccess) {
                            setState(() {
                              weather = state.weather;
                              print('Weather data updated: ${weather.name}');
                            });
                          }
                          if (state is GetWeatherDataError) {
                            print(state.error.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                    state.error.toString() == "city not found"
                                        ? "لا يوجد مدينة بهذا الاسم اكتب الاسم بطريقة صحيحة"
                                        : state.error.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: "flutterfonts",
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return CardWidget(
                            weather: weather,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BlocConsumer<HomeScreenCubit, HomeScreenState>(
                listener: (context, state) {
                  if (state is GetWeatherDataSuccessList) {
                    setState(() {
                      weatherList = state.weatherList;
                      print('Weather list updated');
                    });
                  }
                },
                builder: (context, state) {
                  return MyList(
                    weatherList: weatherList,
                  );
                },
              ),
              BlocConsumer<HomeScreenCubit, HomeScreenState>(
                listener: (context, state) {
                  if (state is GetFiveDaysWeatherDataSuccess) {
                    setState(() {
                      fiveDaysData = state.weather;
                      print('Five days weather data updated');
                    });
                  }
                },
                builder: (context, state) {
                  return MyChart(
                    fiveDaysWeatherDataModel: fiveDaysData,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
