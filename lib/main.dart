import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/logic/helper_method.dart';
import 'pages/main_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            navigatorKey: navigateKey,
            debugShowCheckedModeBanner: false,
            title: 'Quran',
            home: const Directionality(
              textDirection: TextDirection.rtl,
              child: MainPageView(),
            ),
          );
        });
  }
}
