import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';
import '../../core/images.dart';
import '../widgets/app_button.dart';
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
      duration: Duration(milliseconds: 150),
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
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 56),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(logo, height: 50),
                Expanded(
                  child: Container(
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
                          text: 'Gain fast and easy access to patient database',
                        ),
                        OnboardColumn(
                          imgPath: onboarding2,
                          text: 'Track and manage medical records with ease',
                        ),
                        OnboardColumn(
                          imgPath: onboarding3,
                          text: 'Read and edit patient records fast',
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(height: 20),
                _currentPage != _numPages - 1
                    ? AppButton(
                        label: "NEXT",
                        color: Colors.white,
                        textColor: Colors.black87,
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      )
                    : AppButton(
                        label: "GET STARTED",
                        color: Colors.white,
                        textColor: Colors.black87,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalScreen()),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardColumn extends StatelessWidget {
  final String imgPath;
  final String text;

  OnboardColumn({
    this.imgPath,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imgPath,
          matchTextDirection: false,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
