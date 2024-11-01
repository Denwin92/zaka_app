import 'dart:async';

import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/widgets/zaka_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/zaka_onboarding_card_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);
  late List<Widget> _onBoardingPages;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _onBoardingPages = [
      const OnboardingCard(
        image: "assets/images/Zaka_logo.png",
        title: 'Welcome!',
        description:
            'Tap & Transfer: Effortless money transfers, right at your fingertips. Send money instantly, securely, and conveniently.',
      ),
      const OnboardingCard(
        image: "assets/images/OB2.png",
        title: "It's Safe!",
        description:
            'Your financial security is our top priority. We use advanced encryption technology to protect your sensitive information, ensuring your peace of mind.',
      ),
      const OnboardingCard(
        image: "assets/images/OB3.png",
        title: 'Always Online :) ',
        description:
            "Stay connected, no matter where you are. Our app works seamlessly, even when you're offline, so you can send and receive money anytime, anywhere.",
      ),
      const OnboardingCard(
        image: "assets/images/OB2.png",
        title: 'Transfer Funds, Simplified',
        description:
            'Send money to friends, family, or businesses with just a few taps. Our easy-to-use interface makes transfers quick and hassle-free.',
      ),
      const OnboardingCard(
        image: "assets/images/OB1.png",
        title: 'Register now!',
        description:
            'Ready to experience the future of money transfer? Click "Proceed to Register" to get started.',
      ),
    ];

    _initiateAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _initiateAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _onBoardingPages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: _onBoardingPages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _onBoardingPages.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Colors.yellow,
                      dotColor: Colors.white.withOpacity(0.3),
                      dotWidth: 16,
                      dotHeight: 16),
                  onDotClicked: (index) {
                    _pageController.animateToPage(index,
                        duration: Duration.zero, curve: Curves.linear);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ZakaButton(
                          buttonText: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, loginScreen);
                          },
                          minWidth: 60),
                      ZakaButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            Navigator.pushNamed(context, registrationScreen);
                          },
                          minWidth: 90)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
