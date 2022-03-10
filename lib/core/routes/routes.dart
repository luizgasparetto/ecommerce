import 'package:ecommerce/app/presentation/ui/views/frequently_questions_page.dart';
import 'package:ecommerce/app/presentation/ui/views/product_details_page.dart';
import 'package:flutter/material.dart';

import '../../app/presentation/ui/views/home_page.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case ProductDetailsPage.routeName:
        return ProductDetailsPage.route();
      case FrequentlyQuestionsPage.routeName:
        return FrequentlyQuestionsPage.route();
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
