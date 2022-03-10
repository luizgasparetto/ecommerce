import 'package:flutter/material.dart';

class FrequentlyQuestionsPage extends StatelessWidget {
  const FrequentlyQuestionsPage({Key? key}) : super(key: key);

  static const String routeName = '/frequently_questions';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FrequentlyQuestionsPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
      ),
    );
  }
}
