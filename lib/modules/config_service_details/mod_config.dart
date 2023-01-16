import 'package:flutter/material.dart';

import '../../core/colors.dart';

class ModConfig extends StatelessWidget {
  /// This widget is the configuration of the service
  /// when the user has not yet configured the service
  /// and the service is not yet active.
  const ModConfig({
    Key? key,
    required this.title,
    required this.subttitle,
    required this.buttonName,
  }) : super(key: key);
  final String title;
  final String subttitle;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Modalidad: ',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: ColorsReemp.white.withOpacity(.5),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  subttitle,
                  style: TextStyle(
                    color: ColorsReemp.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Icon(
              Icons.settings,
              size: 70,
              color: ColorsReemp.white.withOpacity(.5),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Aún no agregas las ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'zonas a ',
                        style: TextStyle(
                          color: ColorsReemp.white.withOpacity(.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            'donde dispondrás tus servicios en esta modalidad.',
                        style: TextStyle(
                          color: ColorsReemp.white.withOpacity(.5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorsReemp.backgroundButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_circle,
                          color: ColorsReemp.blue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          buttonName,
                          style: const TextStyle(
                            color: ColorsReemp.blue,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: ColorsReemp.blue,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
