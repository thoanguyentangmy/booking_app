import 'package:booking_app/fogot_password/forgot_password_screen.dart';
import 'package:booking_app/screens/login_success/login_screen_success.dart';
import 'package:booking_app/screens/onboarding/onboarding_screen.dart';
import  'package:booking_app/screens/home/home_screen.dart';
import 'package:booking_app/screens/sign_in/sign_in_screen.dart';
import 'package:booking_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  HomeScreen.routeName: (context) => HomeScreen(),
};