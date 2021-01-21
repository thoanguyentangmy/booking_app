
import 'package:booking_app/init/size_config.dart';
import 'package:booking_app/screens/onboarding/components/body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = '/onBoarding';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
