import 'package:flutter/material.dart';
import 'package:tailors_ui/screens/appoinment.dart';
import 'package:tailors_ui/screens/calender.dart';
import 'package:tailors_ui/screens/intro_screen .dart';
import 'package:tailors_ui/screens/sign_in_screen.dart';

import 'a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:CustomCalendarUI(),
    );
  }
}

