import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/networking/models/weather_output_model.dart';
import '../../business_logic/cubit/home_screen_cubit.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.weather});

  final WeatherOutputModel weather;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if (weather.weather?[0].description != null) {
          return Container(
            width: width,
            // height: height * .5,
            padding: EdgeInsets.only(
              top: height * .01,
              left: width * .02,
              right: width * .02,
            ),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: height * .005,
                      left: width * .002,
                      right: width * .002,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            weather.name?.toUpperCase() ?? '',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black45,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'flutterfonts',
                                    ),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black45,
                                      fontSize: 16.sp,
                                      fontFamily: 'flutterfonts',
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 50.w),
                        child: Column(
                          children: <Widget>[
                            Text(
                              weather.weather?[0].description ?? '',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.black45,
                                        fontSize: 22.sp,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                            Text(
                              '${((weather.main?.temp ?? 0) - 273.15).round().toString()}\u2103',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.black45,
                                    fontSize: 40.sp,
                                    fontFamily: 'flutterfonts',
                                  ),
                            ),
                            Text(
                              'min: ${((weather.main?.tempMin ?? 0) - 273.15).round().toString()}\u2103 / max: ${((weather.main?.tempMax ?? 0) - 273.15).round().toString()}\u2103',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.black45,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: width * .01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: width * .25,
                              height: height * .1,
                              child: weather.weather![0].description!
                                      .contains("غيوم")
                                  ? LottieBuilder.asset(
                                      'assets/anims/cloudy_main.json')
                                  : LottieBuilder.asset(
                                      'assets/anims/cloudy.json'),
                            ),
                            Text(
                              'wind ${weather.wind?.speed ?? 0} m/s',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.black45,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: height * .1),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black45,
              ),
            ),
          );
        }
      },
    );
  }
}
