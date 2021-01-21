import 'file:///D:/Working/Android/Project/2020/Sample/booking_app/lib/init/constants.dart';
import 'package:booking_app/components/default_button.dart';
import 'package:booking_app/init/size_config.dart';
import 'package:booking_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onBoarding = [
    {
      'title': 'Fabulous, Or Free',
      'text': 'Enjoy a fabulous hospital else we pay for you.',
      'image': 'assets/images/onboarding1.svg'
    },
    {
      'title': 'Manage Bookings',
      'text': 'Bookings or Cancellation anytime, anywhere you want to.',
      'image': 'assets/images/onboarding2.svg'
    },
    {
      'title': 'Find Best Deals',
      'text': 'Stay with us and find best deals on every stay',
      'image': 'assets/images/onboarding3.svg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (value) => {
                        setState(() {
                          currentPage = value;
                        })
                      },
                  itemCount: onBoarding.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                        title: onBoarding[index]['title'],
                        text: onBoarding[index]['text'],
                        imageUrl: onBoarding[index]['image'],
                      )),
              flex: 3,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(flex:1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoarding.length,
                      (index) => buildIndicator(index),
                    ),
                  ),
                  Spacer(flex:3),
                   DefaultButton(text: 'Get Started', onPress:  () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }
                  ),
                  Spacer(flex:1),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  AnimatedContainer buildIndicator(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String text;
  final String imageUrl;

  const OnBoardingContent({Key key, this.title, this.text, this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          imageUrl,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(26),
              color: kTextColor1,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: kTextColor2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
