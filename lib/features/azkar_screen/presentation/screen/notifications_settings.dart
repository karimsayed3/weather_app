
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/azkar_screen/data/model/zerk_notification_time.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/app_drawer.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/notification_setting.dart';

class NotificationsSettings extends StatefulWidget {
  static const String routeName = "notifications-settings";

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  TimeOfDay time = TimeOfDay(hour: 3, minute: 55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "إعدادات الإشعار",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    NotificationSetting(
                      name: "أذكار الصباح",
                      time: ZekrNotificationTime(
                        hours: 7,
                      ),
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NotificationSetting(
                      name: "أذكار المساء",
                      time: ZekrNotificationTime(
                        hours: 7,
                        isAm: false,
                      ),
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    NotificationSetting(
                      name: "صلاة الوتر",
                      time: ZekrNotificationTime(
                        hours: 10,
                        isAm: false,
                      ),
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
