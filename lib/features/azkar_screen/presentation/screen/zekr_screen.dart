
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';
import 'package:weather_app/constants/constance.dart';
import 'package:weather_app/core/helpers/arabic_harakat_remover.dart';
import 'package:weather_app/core/helpers/arabic_number_converter.dart';
import 'package:weather_app/features/azkar_screen/data/data_base/azkar_data.dart';
import 'package:weather_app/features/azkar_screen/data/model/categiory_model.dart';
import 'package:weather_app/features/azkar_screen/data/model/zekr_model.dart';
import 'package:weather_app/features/azkar_screen/presentation/widgets/centered_text.dart';


class ZekrScreen extends StatefulWidget {
  static String routeName = "/zekr";
  static const String _marra = "مرة", _marrat = "مرات";

  @override
  State<ZekrScreen> createState() => _ZekrScreenState();
}

class _ZekrScreenState extends State<ZekrScreen> {
  Zekr _currentZekr = Zekr(
    category: CategoryModel(name: ""),
    zekr: "",
    reference: "",
    description: "",
    count: 0,
  );
  late final CategoryModel _category;
  final List<Zekr> _azkar = [];
  int _fontSize = 20;
  final PageController _pageController = PageController();
  double _currentPage = 0;
  bool _withHarakat = true;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toDouble();
        _currentZekr = _azkar[_pageController.page!.toInt()];
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
    _category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    for (dynamic zekr in azkarData) {
      if (zekr['category'] == _category.name) {
        _azkar.add(Zekr.fromJson(zekr));
      }
    }
    _currentZekr = _azkar[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          _category.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    _withHarakat = !_withHarakat;
                  });
                },
                child: ListTile(
                  leading: Icon(
                    _withHarakat
                        ? Icons.cancel_outlined
                        : Icons.add_box_outlined,
                  ),
                  title: _withHarakat
                      ? Text("إزالة الحركات")
                      : Text("إضافة الحركات"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  if (_fontSize < 26) setState(() => _fontSize++);
                },
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text("زيادة حجم الخط"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  if (_fontSize > 14) setState(() => _fontSize--);
                },
                child: ListTile(
                  leading: Icon(Icons.remove),
                  title: Text("تقليص حجم الخط"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Share.share(
                      "${_currentZekr.zekr}\n\n${_currentZekr.description}\n${_currentZekr.reference}");
                },
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text("مشاركة"),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: _currentZekr.zekr.trim()))
                      .then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("تم النسخ بنجاح"),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text("نسخ"),
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _azkar.length,
            itemBuilder: (ctx, index) => LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                      // height: constraints.maxHeight,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CenteredText(
                                _withHarakat
                                    ? _azkar[index].zekr
                                    : _azkar[index].zekr.withOutHarakat(),
                                fontSize: _fontSize.toDouble(),
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontFamily: "noto",
                                color: greyTextColor,
                              ),
                              SizedBox(height: 20),
                              if (_azkar[index].reference.isNotEmpty)
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    _azkar[index].reference,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: greyTextColor.withOpacity(.70),
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            children: [
                              if (_azkar[index].count >= 2 ||
                                  _azkar[index].description.isNotEmpty)
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  elevation: 0,
                                  color: Colors.tealAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        if (_azkar[index].count >= 2)
                                          Text(
                                            "${_azkar[index].count.convertToArabicNumber()} ${_azkar[index].count < 3 ? _azkar[index].count == 1 ? ZekrScreen._marra : "مرتين" : _azkar[index].count < 11 ? ZekrScreen._marrat : ZekrScreen._marra}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: greyTextColor,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        if (_azkar[index].count >= 2 &&
                                            _azkar[index]
                                                .description
                                                .isNotEmpty)
                                          SizedBox(height: 10.h),
                                        if (_azkar[index]
                                            .description
                                            .isNotEmpty)
                                          Text(
                                            _azkar[index].description,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: greyTextColor,
                                              fontSize: 16.sp,
                                              height: 1.5,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(height: 16),
                              // CenteredText(
                              //   "صفحة ${(index + 1).convertToArabicNumber()} من ${_azkar.length.convertToArabicNumber()}",
                              //   fontWeight: FontWeight.bold,
                              //   color: greyTextColor,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       _azkar.length,
          //       (index) => Container(
          //         margin: EdgeInsets.all(1),
          //         color: _currentPage == index ? Colors.green : Colors.red,
          //         width: 10,
          //         height: 10,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      width: double.infinity,
                      height: 8,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: primarySwatch.withOpacity(.18),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          Container(
                            width: (((_currentPage + 1) / _azkar.length) *
                                    (100 / 100)) *
                                constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: primarySwatch,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
