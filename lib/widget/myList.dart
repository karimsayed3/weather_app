import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../core/networking/models/weather_output_model.dart';
import '../features/home_screen/business_logic/cubit/home_screen_cubit.dart';

class MyList extends StatelessWidget {
final  List<WeatherOutputModel> weatherList;
  MyList({Key? key,required this.weatherList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2.sh,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: weatherList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 0.25.sw,
            // height: 150.h,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      weatherList[index].name ?? '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                    Text(
                      '${((weatherList[index].main!.temp!) - 273.15).round().toString()}\u2103',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                    SizedBox(
                      width: 0.1.sw,
                      height: .06.sh,
                      child: weatherList[index].weather![0].description!.contains("غيوم") ? LottieBuilder.asset('assets/anims/cloudy_main.json') : LottieBuilder.asset('assets/anims/cloudy.json'),
                    ),
                    Text(
                      weatherList[index].weather![0].description ?? '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black45,
                        fontFamily: 'flutterfonts',
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
