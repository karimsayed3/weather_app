import 'package:flutter/material.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/azkar_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Define the duration for which the splash screen should be displayed
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed( AzkarScreen.routeName);
      // Navigate to the main screen after the specified duration
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => AzkarScreen()));
     // Navigator.pushNamed(context, Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      // Customize the appearance of your splash screen
      body: Center(
        child: Image.asset(
          "assets/images/azkar_logo.png",
        ),
      ),
    );
  }
}