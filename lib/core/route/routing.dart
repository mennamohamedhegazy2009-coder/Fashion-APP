import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/ForgetPassword.dart';
import 'package:flutter_application_1/features/home/presentation/Home.dart';
import 'package:flutter_application_1/features/auth/presentation/Login.dart';
import 'package:flutter_application_1/features/auth/presentation/Signup.dart';
import 'package:flutter_application_1/Splash.dart';
import 'package:flutter_application_1/features/cart/presentation/cartscreen.dart';
import 'package:flutter_application_1/core/route/app_route.dart';
import 'package:flutter_application_1/features/cart/presentation/detailsof%20payment.dart';
import 'package:flutter_application_1/features/setting/presentation/editprofile.dart';
import 'package:flutter_application_1/features/onboarding/presentation/onbourding.dart';
import 'package:flutter_application_1/features/cart/presentation/shoppingpage.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _materialRoute( SplashScreen());

      case AppRoutes.onboarding:
        return _materialRoute( OnboardingScreen());

      case AppRoutes.login:
        return _materialRoute( LoginScreen());

      case AppRoutes.register:
        return _materialRoute(SignUpScreen());

      case AppRoutes.forgotPassword:
        return _materialRoute(const ForgotPasswordScreen());

      case AppRoutes.home:
        return _materialRoute( HomeScreen());
      case AppRoutes.productDetails:
        return _materialRoute(
          ProductDetailsScreen(),
        );

      case AppRoutes.cart:
        return _materialRoute(const ShoppingBagScreen());

      case AppRoutes.checkout:
        return _materialRoute(const CheckoutScreen());


      case AppRoutes.profile:
        return _materialRoute(const EditProfileScreen());

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _materialRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Route not found'),
        ),
      ),
    );
  }
}
