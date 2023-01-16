import 'package:flutter/material.dart';

/// This class is the splash page
/// of the app
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
