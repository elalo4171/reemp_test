import 'package:flutter/material.dart';
import 'package:reemp/core/assets.dart';
import 'package:reemp/core/colors.dart';
import 'package:reemp/global_widgets/circular_menu_widget.dart';
import 'package:reemp/global_widgets/custom_appbar.dart';

class ConfigServiceDetails extends StatefulWidget {
  const ConfigServiceDetails({super.key});

  @override
  State<ConfigServiceDetails> createState() => _ConfigServiceDetailsState();
}

class _ConfigServiceDetailsState extends State<ConfigServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const CustomAppbar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsReemp.blue.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularOption(
                        icon: Assets.car,
                        onTap: () {},
                        iconSize: 25,
                        isSelectd: false,
                        size: 60,
                      ),
                      CircularOption(
                        icon: Assets.disable,
                        onTap: () {},
                        iconSize: 35,
                        size: 60,
                      ),
                      CircularOption(
                        icon: Assets.resident,
                        onTap: () {},
                        iconSize: 25,
                        size: 60,
                      ),
                      CircularOption(
                        icon: Assets.payment,
                        onTap: () {},
                        iconSize: 25,
                        size: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
