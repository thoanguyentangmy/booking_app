import 'package:booking_app/init/constants.dart';
import 'package:booking_app/init/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
int _currentIndexBottomBar = 0;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'My Stay': Icons.save_outlined,
    'Favorite': Icons.favorite_border_rounded,
    'Setting': Icons.account_circle_outlined
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySearching(),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomNavigation() {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _icons
            .map((title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      size: 30.0,
                    ),
                    label: title)))
            .values
            .toList(),
        currentIndex: _currentIndexBottomBar,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: 11.0,
        unselectedItemColor: kSecondaryColor,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() => _currentIndexBottomBar = index),
      ),
    );
  }
}

class BodySearching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Stack(children: [
      Image.asset('assets/images/bg_hotel.jpg'),
      Padding(
          padding: EdgeInsets.only(top: 250.0),
          child: Stack(children: [
            Container(
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select City',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.03),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: kSecondaryColor,
                              )),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.03),
                      Row(
                        children: [TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: kSecondaryColor,
                                )),
                          ),
                        ),],
                      )

                    ]))
          ]))
    ])));
  }
}
