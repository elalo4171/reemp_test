import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reemp/core/assets.dart';
import 'package:reemp/global_widgets/custom_appbar.dart';
import 'package:reemp/global_widgets/icons_custom.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  /// This controller is used to animate the logo
  /// of the app
  /// The animation is a [Tween] from 200 to 250
  /// and the [CurvedAnimation] is [Curves.easeIn]
  late AnimationController controllerAnimation;
  late Animation<double> _sizeAnimation;
  @override
  void initState() {
    controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _sizeAnimation = Tween<double>(
      begin: 200,
      end: 250,
    ).animate(
      CurvedAnimation(
        parent: controllerAnimation,
        curve: Curves.easeIn,
      ),
    );
    controllerAnimation.forward();
    controllerAnimation.addListener(() {
      if (controllerAnimation.isCompleted) {
        controllerAnimation.reverse();
        return;
      }
      if (controllerAnimation.isDismissed) {
        controllerAnimation.forward();
        return;
      }
      setState(() {});
    });
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      if (mounted)
        Navigator.pushReplacementNamed(context, "config_service_details");
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const CustomAppbar(),
            Expanded(
              child: Center(
                child:
                    IconsCustom(icon: Assets.logo, size: _sizeAnimation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
