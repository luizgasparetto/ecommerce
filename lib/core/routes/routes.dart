import 'package:ecommerce/app/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      default:
        return _defaultPage();
    }
  }

  static Route _defaultPage() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(),
    );
  }
}