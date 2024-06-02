import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/helpers/arabic_number_converter.dart';
import 'package:weather_app/features/azkar_screen/data/model/zerk_notification_time.dart';


class NotificationSetting extends StatelessWidget {
  final ZekrNotificationTime time;
  final String name;
  final void Function() onPressed;

  const NotificationSetting({
    required this.time,
    required this.onPressed,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
       //   backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text(
              "${time.hours.convertToArabicNumber()}:${time.minutes > 10 ? time.minutes.convertToArabicNumber() : "${0.convertToArabicNumber()}${time.minutes.convertToArabicNumber()}"} ${time.isAm ? "ص" : "م"}",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
        onPressed: onPressed,

      ),
    );
  }
}
