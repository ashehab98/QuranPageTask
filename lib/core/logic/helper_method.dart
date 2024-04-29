import 'package:flutter/material.dart';

final navigateKey = GlobalKey<NavigatorState>();
void navigateTo(Widget page) => Navigator.push(
    navigateKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ));