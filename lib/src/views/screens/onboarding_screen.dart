import 'package:IvoryCloud/src/views/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';
import '../../core/images.dart';
import 'hospital_page_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds:150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: isActive ? 10.0 : 10.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        logo,
                        height: 50,
                      )
                    ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        OnboardColumn(
                          imgPath: onboarding1,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: OnboardColumn(
                              imgPath: onboarding2,
                            )),
                        Padding(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: OnboardColumn(
                              imgPath: onboarding3,
                            )
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _currentPage != _numPages - 1
                    ? CustomButton(
                        text: "NEXT",
                        width: 100,
                        onButtonPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      )
                    : CustomButton(
                        text: "GET STARTED",
                        width: 200,
                        onButtonPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()));
                        },
                      ),
                ],
              ),
            ),
          ),
        )
      );
  }
}

class OnboardColumn extends StatelessWidget {
  final String imgPath;
  OnboardColumn({
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            imgPath,
            matchTextDirection: false,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
          )
        )
      ],
    );
  }
}
