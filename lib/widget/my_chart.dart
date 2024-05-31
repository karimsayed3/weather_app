import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../model/five_days_data.dart';

class MyChart extends StatelessWidget {

 final List<FiveDayData> fiveDaysWeatherDataModel;
  MyChart({super.key, required this.fiveDaysWeatherDataModel});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDayData, String>>[
            SplineSeries<FiveDayData, String>(
              dataSource: fiveDaysWeatherDataModel,
              xValueMapper: (FiveDayData f, _) =>
              f.dateTime,
              yValueMapper: (FiveDayData f, _) =>
              f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
