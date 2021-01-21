import 'file:///D:/Working/Android/Project/2020/Sample/booking_app/lib/init/constants.dart';
import 'package:booking_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'init/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kTextColor1),
            bodyText2: TextStyle(color: kTextColor2),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: OnBoardingScreen.routeName,
      routes: routes,
    );
  }
}
