import 'package:flutter/material.dart';
import 'package:reemp/core/assets.dart';
import 'package:reemp/core/colors.dart';
import 'package:reemp/global_widgets/icon_selectable.dart';
import 'package:reemp/global_widgets/icons_custom.dart';
import 'package:reemp/global_widgets/stepper_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<String> mods = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                  Text("Regresar"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    StepperWidget(
                      showCounter: true,
                      icons: const [
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child:
                              IconsCustom(icon: Assets.description, size: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child:
                              IconsCustom(icon: Assets.locationIcon, size: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: IconsCustom(icon: Assets.movie, size: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: IconsCustom(icon: Assets.work, size: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: IconsCustom(icon: Assets.payment, size: 20),
                        ),
                      ],
                      color: ColorsReemp.blue,
                      width: MediaQuery.of(context).size.width,
                      curStep: 2,
                    ),
                    const Center(
                      child: IconsCustom(
                        icon: Assets.person,
                        size: 75,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Facilita y amplía\ntus encuentros",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Selecciona las modalidades en la que dispondrás este servicio.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconSelectable(
                            icon: Assets.car,
                            onSelect: (value) {
                              if (value) {
                                mods.add("car");
                              } else {
                                mods.remove("car");
                              }
                              setState(() {});
                            },
                          ),
                          IconSelectable(
                            icon: Assets.bussines,
                            onSelect: (value) {
                              if (value) {
                                mods.add("bussines");
                              } else {
                                mods.remove("bussines");
                              }
                              setState(() {});
                            },
                          ),
                          IconSelectable(
                            icon: Assets.resident,
                            iconSize: 50,
                            onSelect: (value) {
                              if (value) {
                                mods.add("resident");
                              } else {
                                mods.remove("resident");
                              }
                              setState(() {});
                            },
                          ),
                          IconSelectable(
                            icon: Assets.bussines,
                            onSelect: (value) {
                              if (value) {
                                mods.add("bussines");
                              } else {
                                mods.remove("bussines");
                              }
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "To go,",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    " lleva tu servicio hasta donde el usuario lo solicite.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: mods.isNotEmpty
                                  ? () {
                                      Navigator.pushNamed(
                                          context, 'config_service');
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: ColorsReemp.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                              ),
                              child: const Text('Siguiente')),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
