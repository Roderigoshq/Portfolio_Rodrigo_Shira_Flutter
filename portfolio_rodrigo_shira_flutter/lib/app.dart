import 'package:flutter/material.dart';
import 'package:portfolio_rodrigo_shira_flutter/pages/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Index(),
    );
  }
}