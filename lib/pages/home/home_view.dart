import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quraanpage/core/designs/app_images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  int durarion = 30;

  int _seconds = 30;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) _seconds--;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 16.h),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  AppImage(
                    "assets/images/person.jpg",
                    fit: BoxFit.scaleDown,
                    height: 80.h,
                    width: 80.w,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "اهلا بك",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Text(
                          "محمد ابراهيم احمد",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                ]),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 7.5,
                    top: 8.7,
                    bottom: 5.7,
                  ),
                  height: 33,
                  width: 32,
                  child: InkWell(
                    onTap: () {},
                    child: const Badge(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.5,
                        vertical: 0,
                      ),
                      offset: Offset(9, -12),
                      backgroundColor: Colors.red,
                      label: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: AppImage(
                        "assets/icons/svg/bell.png",
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 30.h),
              Column(
                children: [
                  CarouselSlider(
                    items: List.generate(
                      3,
                      (index) => AppImage(
                        "assets/images/slider.jpg",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    options: CarouselOptions(
                      height: 180.h,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        currentIndex = index;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsetsDirectional.only(end: 8.w),
                        child: Container(
                          height: 5.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: index == currentIndex
                                ? Colors.green
                                : const Color(0xff979797),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 160.w,
                          height: 160.h,
                          child: CircularCountDownTimer(
                            isTimerTextShown: false,
                            duration: durarion,
                            initialDuration: 0,
                            controller: CountDownController(),
                            width: 160.w,
                            height: 160.h,
                            ringColor: Colors.amber,
                            fillColor: const Color(0xffD8D8D8),
                            strokeWidth: 10.w,
                            textStyle: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textFormat: CountdownTextFormat.MM_SS,
                            isReverseAnimation: false,
                          ),
                        ),
                        Positioned(
                          // top: 0.h,
                          // left: 60.w,
                          // right: 60.w,
                          // bottom: 160.h,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.amber, width: 3.w),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: const Icon(
                              Icons.account_balance,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          left: 0.w,
                          right: 0.w,
                          top: 30.h,
                          child: Text(
                            "الباقة الفضية",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          left: 0.w,
                          right: 0.w,
                          top: 60.h,
                          child: Text(
                            "$durarion:00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          bottom: 0.h,
                          left: 0.w,
                          right: 0.w,
                          top: 100.h,
                          child: const Text(
                            "صالحة لمدة 28 يوم",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          top: 135.h,
                          right: 30.w,
                          left: 30.w,
                          bottom: 20.h,
                          child: SizedBox(
                            height: 50.h,
                            width: 100.w,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "الدقائق المتبقية",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "$_seconds:00",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "المعلمون الاكثر تقييم",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.indigo),
                ),
                InkWell(
                  child: Text(
                    "المزيد",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
              ]),
              SizedBox(height: 16.h),
              SizedBox(
                height: 170.h,
                child: ListView.separated(
                  itemBuilder: (context, index) => const _TeacherItems(),
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ]),
      ),
    );
  }
}

class _TeacherItems extends StatelessWidget {
  const _TeacherItems();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(children: [
        Stack(children: [
          AppImage(
            "assets/images/person.jpg",
            fit: BoxFit.scaleDown,
            height: 120.h,
            width: 120.w,
          ),
          Positioned(
            bottom: 18,
            right: 25,
            child: CircleAvatar(
              radius: 7.r,
              backgroundColor: Colors.green,
            ),
          ),
        ]),
        const Text("محمد ابراهيم احمد"),
        const Row(children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text("4.5"),
        ]),
      ]),
    );
  }
}
