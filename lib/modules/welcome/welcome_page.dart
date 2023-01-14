import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reemp/global_widgets/circular_menu_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  final double sizeCircle = 60;
  final double sizeCircleSelected = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Welcome Page"),
          ),
          Container(
            color: Colors.blueGrey,
            child: CircularMenu(
              sizeCircle: sizeCircle,
              sizeCircleSelected: sizeCircleSelected,
              sizeScreen: MediaQuery.of(context).size,
            ),
          )
        ],
      ),
    );
  }
}
