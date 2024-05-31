import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;
  final String token;

  AppInterceptor({required this.dio, required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // options.headers[]
    // options.headers['Authorization'] = 'Bearer ${CacheHelper.getdata(key: 'accountType')}';
    // print("onRequest method");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
    // await  CacheHelper.removeData(key: 'login');
    // await   CacheHelper.removeData(key: 'accessToken');
    // await   CacheHelper.removeData(key: 'unit');
    // await   CacheHelper.removeData(key: 'token');

      // if(!isMobile()){
      //   navigateToPage(Routes.loginScreenDesktop);
      //   remove();
      // }
      // if(isMobile()){
      //   navigateToPage(Routes.loginScreenMobile);
      //   remove();
      // }
      debugPrint("sssssssssssssssss");

      //
      // CacheHelper.removeData(key: 'login')
      //     .then((value) => CacheHelper.removeData(key: 'accessToken'))
      //     .then((value) {
      //   // Navigator.pushNamedAndRemoveUntil(
      //   //     context, splashScreen, (route) => false);
      // });
    }

    super.onError(err, handler);
  }
}
