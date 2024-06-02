
import 'package:flutter/material.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/allah_names_screen.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/notifications_settings.dart';
import 'package:weather_app/features/home_screen/presentation/screen/home_screen.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "أذكاري",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "\"فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُواْ لِي وَلاَ تَكْفُرُون\"",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "الأذكار",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
             // Navigator.of(context).pushReplacementNamed( ZekrScreen.routeName);
            },
          ),
          Divider(thickness: 2, height: 0),
          ListTile(
            title: Text(
              "أسماء الله الحسنى",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AllahNamesScreen.routeName);
            },
          ),
          Divider(thickness: 2, height: 0),
          ListTile(
            title: Text(
              "إعدادات الإشعار",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(NotificationsSettings.routeName);
            },
          ),
          Divider(thickness: 2, height: 0),
          ListTile(
            title: Text(
              "شوف الطقص",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          Divider(thickness: 2, height: 0),
        ],
      ),
    );
  }
}
//أ