import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../authentication/register_page.dart';
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'FIND THE BEST FASHION STYLE FOR YOU',
            body: 'Shop here and get best quality items.',
            image: buildImage("assets/anim/onboarding_lottie_1.json"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'CHECKOUT AND MAKE PAYMENT SEAMLESSLY',
            body: 'Shop with us, purchase items and make payments under few seconds. ',
            image: buildImage("assets/anim/onboarding_lottie_2.json"),
            //getPageDecoration, a method to customise the page style
            decoration: getPageDecoration(),
          ),
        ],
          onDone: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterPage()))
          ,
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip:
          const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done:
          const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  Widget buildImage(String imagePath) {
    return Center(
        child: LottieBuilder.asset(
          imagePath,
          width: 450,
          height: 200,
          repeat: false,
        ));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      bodyPadding: EdgeInsets.only(top: 80, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 150),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
