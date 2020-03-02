import 'package:flutter/material.dart';

import './register_page.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'onboarding';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> onBoardingContent = [
    {
      "title": "Hey Foodie!",
      "description": '''Taking a customer's order could never have been easy. In three step you can make it happen.''',
      "imagePath": "assets/images/success.png",
    },
    {
      "title": "It Simple, First!",
      "description":
          '''Create a list of available meal you can purchase around you. Also create a list of customers.''',
      "imagePath": "assets/images/success.png",
    },
    {
      "title": "Take the Order",
      "description": '''Take a customer's order by selecting the customers desired meal, receive payment for the order, and thats it!\nSo lets get started''',
      "imagePath": "assets/images/success.png",
    }
  ];
  String imagePath = 'assets/images/success.png';
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onBoardingContent.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(onBoardingContent[index]["imagePath"]),
                        SizedBox(height: 0.069 * size.height),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 36.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: onBoardingContent[index]["title"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "WorkSans",
                                        color: Colors.black,
                                        fontSize: 21.0),
                                  ),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                    text: onBoardingContent[index]["description"],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: "WorkSans",
                                      color: Colors.black,
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
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Image.asset("assets/images/nextBtn.png"),
                        onTap: () {
                          switch (pageController.page.toInt()) {
                            case 0:
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                              break;
                            case 1:
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                              break;
                            case 2:
                              Navigator.of(context)
                                  .pushNamed(RegisterPage.id);
                              break;
                            default:
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
/*
  Widget onBoardingPages(
      {String title,
      description,
      imagePath,
      Size size,
      PageController pageController}) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          // color: Color(0xffcd99ee),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Column(children: <Widget>[
                Image.asset(imagePath),
                SizedBox(height: 0.069 * size.height),
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: "WorkSans",
                              color: Colors.black,
                              fontSize: 16.0),
                        ),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\n'),
                        TextSpan(
                          text: description,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: "WorkSans",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  child: Image.asset("assets/images/nextBtn.png"),
                  onTap: () {
                    switch (pageController.page.toInt()) {
                      case 0:
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                        break;
                      case 1:
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                        break;
                      case 2:
                        Navigator.of(context).pushNamed(OnboardingScreen.id);
                        break;
                      default:
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
    */
}
