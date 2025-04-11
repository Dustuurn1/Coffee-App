import 'package:flutter/material.dart';
import '../views/user_profile_view.dart';
import '../views/make_coffee_view.dart';
import '../views/main_menu_view.dart';
import '../views/stats_view.dart';
import '../views/signin_view.dart';
// Import other views

class Routes {
  static const String login = '/';
  static const String mainMenu = '/main-menu';
  static const String userProfile = '/user-profile';
  static const String makeCoffee = '/make-coffee';
  static const String statistics = '/stat-coffee';
  // Add other routes

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => SignInView(),
      mainMenu: (context) => MainMenuView(),
      userProfile: (context) => UserProfileView(),
      makeCoffee: (context) => MakeCoffeeView(),// Add other routes
      statistics: (context) => StatisticsView(),
    };
  }
}
