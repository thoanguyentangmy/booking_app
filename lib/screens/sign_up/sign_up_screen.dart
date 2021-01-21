import 'package:booking_app/components/default_button.dart';
import 'package:booking_app/fogot_password/forgot_password_screen.dart';
import 'package:booking_app/init/constants.dart';
import 'package:booking_app/init/size_config.dart';
import 'package:booking_app/screens/login_success/login_screen_success.dart';
import 'package:booking_app/screens/onboarding/onboarding_screen.dart';
import 'package:booking_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/screens.sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignUp(),
    );
  }
}

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Spacer(),
                  Image.asset(
                    'assets/images/icon_hotel.png',
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ));
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildUserNameTextField(),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildPasswordTextField(),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            DefaultButton(
                text: 'Create account',
                onPress: () {
                  if (_formKey.currentState.validate())
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            alreadyHaveAccount(context)
          ],
        ));
  }


  TextFormField buildUserNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.perm_identity),
        hintText: 'User name',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: kSecondaryColor,
            )),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter user name';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: Icon(Icons.remove_red_eye_outlined),
        hintText: 'Password',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: kSecondaryColor,
            )),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }
  Row alreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
          child: Text(
            "Log in",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }

}
