import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants/constance.dart';
import 'package:weather_app/features/azkar_screen/data/model/categiory_model.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/zekr_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding:  EdgeInsets.symmetric(vertical: 8.h),
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
    //       // backgroundColor: Colors.teal,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(50.r),
    //       ),
    //     ),
    //     onPressed: () {
    //       Navigator.of(context)
    //           .pushNamed(ZekrScreen.routeName, arguments: category);
    //     },
    //     child: Row(
    //       children: [
    //         // Image.asset(
    //         //   "assets/images/icons8-moon-star-50.png",
    //         // ),
    //         // SizedBox(
    //         //   width: 5.w,
    //         // ),
    //         Text(
    //           category.name,
    //           style: TextStyle(
    //             fontSize: 22,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white.withOpacity(.85),
    //             height: 1.5,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        Navigator.of(context)
            .pushNamed(ZekrScreen.routeName, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: primarySwatch.withOpacity(.07),
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(35.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(4.0.sp),
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0xFFE6E5E4).withOpacity(0.5),
                  //   width: 2,
                  // ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(.85),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
