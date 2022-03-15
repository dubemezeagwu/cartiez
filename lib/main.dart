import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cartiez/helpers/navigation_widget.dart';
import 'package:cartiez/routes/pages/authentication/login_page.dart';
import 'package:cartiez/routes/pages/authentication/register_page.dart';
import 'package:cartiez/routes/pages/presentation/home_page.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: AnimatedSplashScreen(
          nextScreen: const LoginPage(),
            pageTransitionType: PageTransitionType.bottomToTop,
          splashIconSize: 300.0,
          splash: LottieBuilder.asset(
            "assets/anim/shopping-cart.json",
            repeat: false,
          ),
      ),
    );
  }
}

