import 'package:booking_app/components/default_button.dart';
import 'package:booking_app/components/text_form_field.dart';
import 'package:booking_app/fogot_password/forgot_password_screen.dart';
import 'package:booking_app/init/constants.dart';
import 'package:booking_app/init/size_config.dart';
import 'package:booking_app/screens/home/home_screen.dart';
import 'package:booking_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignIn(),
    );
  }
}

class BodySignIn extends StatelessWidget {
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
              Text(
                'WelCome back!',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              SignInForm(),
            ],
          ),
        ),
      ),
    ));
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildUserNameTextField(),
            // TextFormComponent(hintText: 'User name', icon: Icon(Icons.perm_identity), textInputType: TextInputType.text,),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildPasswordTextField(),
            // TextFormComponent(hintText: 'Password', icon: Icon(Icons.lock_outline), textInputType: TextInputType.text,),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: Text(
                  "Forgot Password?",
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            DefaultButton(
                text: 'Sign In',
                onPress: () {
                  if (_formKey.currentState.validate())
                    Navigator.pushNamed(context, HomeScreen.routeName);
                }),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialIcon('assets/icons/facebook_icon.svg'),
                buildSocialIcon('assets/icons/google_icon.svg'),
                buildSocialIcon('assets/icons/twitter_icon.svg'),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            noAccount(context)
          ],
        ));
  }

  Row noAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }

  Container buildSocialIcon(String iconUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(50),
      child: SvgPicture.asset(iconUrl),
    );
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
}
