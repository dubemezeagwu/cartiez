import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cartiez/bloc/cart/cart_bloc.dart';
import 'package:cartiez/data/repository/cart_repository.dart';
import 'package:cartiez/locator.dart';
import 'package:cartiez/presentation/app_routing.dart';
import 'package:cartiez/presentation/helpers/navigation_widget.dart';
import 'package:cartiez/presentation/routes/pages/authentication/login_page.dart';
import 'package:cartiez/presentation/routes/pages/authentication/register_page.dart';
import 'package:cartiez/presentation/routes/pages/onboarding/onboarding_page.dart';
import 'package:cartiez/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CartBloc(cartRepository: CartRepository())..add(CartStarted())
        )

      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Constants.primaryColor,),
          scaffoldBackgroundColor: Constants.bgColor,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        home: AnimatedSplashScreen(
            nextScreen: const OnBoardingPage(),
            pageTransitionType: PageTransitionType.bottomToTop,
            splashIconSize: 300.0,
            splash: LottieBuilder.asset(
              "assets/anim/shopping-cart.json",
              repeat: false,
            ),
          ),

      ),
    );
  }
}

