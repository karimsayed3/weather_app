import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/azkar_screen/data/data_base/azkar_data.dart';
import 'package:weather_app/features/azkar_screen/data/model/categiory_model.dart';
import 'package:weather_app/features/azkar_screen/presentation/screen/zekr_screen.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/category_card.dart';

import '../widgets/app_drawer.dart';


class AzkarScreen extends StatefulWidget {
  static String routeName = "/azkar";

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> _searchCategories = [];

  // bool _isSearching = false;
  @override
  void initState() {
    super.initState();
    for (dynamic zekr in azkarData) {
      if (!_categories.map((e) => e.name).contains(zekr["category"])) {
        if (zekr["category"] != "أذكار الصباح" &&
            zekr["category"] != "أذكار المساء") {
          _categories.add(CategoryModel(name: zekr["category"]));
        }
      }
    }
    _searchCategories = _categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "أذكاري",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         _isSearching = !_isSearching;
        //       });
        //     },
        //     icon: Icon(_isSearching ? Icons.cancel : Icons.search),
        //   )
        // ],
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //         "assets/images/azkar_bg.png",
      //       ),
      //       fit: BoxFit.fill,
      //     ),
      //   ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage(
          //     "assets/images/azkar_bg.png",
          //   ),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.95,
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "بحث",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r))
                  ),
                  onChanged: (val) {
                    List<CategoryModel> searchedCategories = [];
                    for (var category in _categories) {
                      if (category.name.contains(val)) {
                        searchedCategories.add(category);
                      }
                    }
                    setState(() {
                      _searchCategories = searchedCategories;
                    });
                    print(_categories.length);
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.05,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [

                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            // padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            // backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                ZekrScreen.routeName,
                                arguments: CategoryModel(name: "أذكار الصباح"));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons8-muslim-32.png",),
                              SizedBox(width: 5.w,),
                              Text("أذكار الصباح", style: TextStyle(
                                color: Colors.black, fontSize: 14.sp,),),
                            ],
                          ),
                        ),
                        // child: TextButton(
                        //  // borderRadius: BorderRadius.circular(30),
                        //   color: Colors.white,
                        //   onPressed: () {
                        //     Navigator.of(context).pushNamed(ZekrScreen.routeName,
                        //         arguments: CategoryModel(name: "أذكار الصباح"));
                        //   },
                        //   child: Text("أذكار الصباح"),
                        //   // child: Image.asset("assets/images/azkar_sabah.png"),
                        // ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.1,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            // padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            // backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                ZekrScreen.routeName,
                                arguments: CategoryModel(name: "أذكار المساء"));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/icons8-moon-star-50.png",),
                              SizedBox(width: 5.w,),
                              Text("أذكار المساء", style: TextStyle(
                                color: Colors.black, fontSize: 14.sp,),),
                            ],
                          ),
                        ),
                        // child: TextButton(
                        //  // borderRadius: BorderRadius.circular(30),
                        //   color: Colors.white,
                        //   onPressed: () {
                        //     Navigator.of(context).pushNamed(ZekrScreen.routeName,
                        //         arguments: CategoryModel(name: "أذكار الصباح"));
                        //   },
                        //   child: Text("أذكار الصباح"),
                        //   // child: Image.asset("assets/images/azkar_sabah.png"),
                        // ),
                      ),
                      // InkWell(
                      //   borderRadius: BorderRadius.circular(30),
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed(ZekrScreen.routeName,
                      //         arguments: CategoryModel(name: "أذكار المساء"));
                      //   },
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(35),
                      //     child: Image.asset("assets/images/azkar_masa.png"),
                      //   ),
                      // ),
                      SizedBox(height: 20),

                      GridView.builder(
                      //  padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: _searchCategories.length,
                        cacheExtent: 120.h,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(_searchCategories[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      drawer: AppDrawer(),
    );
  }
}

//أ
