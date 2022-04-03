import 'package:cartiez/presentation/routes/pages/authentication/login_page.dart';
import 'package:cartiez/presentation/routes/pages/authentication/register_page.dart';
import 'package:cartiez/presentation/routes/pages/presentation/checkout_cart_page.dart';
import 'package:cartiez/presentation/routes/pages/presentation/home_page.dart';
import 'package:cartiez/presentation/routes/pages/presentation/profile_page.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route<dynamic>? generateRoute (RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/second':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home_page':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/checkout_cart_page':
        return MaterialPageRoute(builder: (_) => CheckoutCartPage());
      case '/profile_page':
        return MaterialPageRoute(builder: (_) => ProfilePage());
        default:
        return null;
    }
  }
}