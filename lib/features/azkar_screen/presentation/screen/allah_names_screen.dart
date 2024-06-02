
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constants/constance.dart';
import 'package:weather_app/core/helpers/arabic_number_converter.dart';
import 'package:weather_app/features/azkar_screen/data/data_base/allah_names.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/app_drawer.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/centered_text.dart';


class AllahNamesScreen extends StatelessWidget {
  static const String routeName = "/allah-names";
  @override
  Widget build(BuildContext context) {
    final List<String> allahNamesList = allahNamesInString.split(".");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "أسماء الله الحسنى",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        itemBuilder: (ctx, index) {
          if (allahNamesList[index].split(":").length > 1) {
            return Card(
              elevation: 0,
              color: primarySwatch.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CenteredText(
                      "${index.convertToArabicNumber()}.${allahNamesList[index].split(":")[0].replaceAll("\n", "")}",
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: "amiri",
                      color: greyTextColor,
                    ),
                    CenteredText(
                      allahNamesList[index].split(":")[1].replaceAll("\n", ""),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: greyTextColor,
                      fontFamily: "amiri",
                    ),
                  ],
                ),
              ),
            );
          } else {
            print(allahNamesList[index]);
            return SizedBox();
          }
        },
        itemCount: allahNamesList.length,
      ),
      drawer: AppDrawer(),
    );
  }
}//حسد
