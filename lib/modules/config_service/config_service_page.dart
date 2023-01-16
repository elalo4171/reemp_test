import 'package:flutter/material.dart';
import 'package:reemp/core/colors.dart';
import 'package:reemp/global_widgets/circular_menu_widget.dart';

class ConfigServicePage extends StatefulWidget {
  const ConfigServicePage({super.key});

  @override
  State<ConfigServicePage> createState() => _ConfigServicePageState();
}

class _ConfigServicePageState extends State<ConfigServicePage> {
  final double sizeCircle = 70;

  final double sizeCircleSelected = 110;

  int initialIndex = 3;

  final Map<int, String> titles = {
    1: "To Go",
    2: "Video Consulta",
    3: "Meeting",
    4: "Residente",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.6, 0.99],
          colors: [
            Colors.black,
            Color(0xff143447),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: Colors.white.withOpacity(.5),
                          ),
                          Text(
                            "Regresar",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Cobertura de servicios",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Configura y habilita ",
                          style: TextStyle(
                              color: ColorsReemp.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 29),
                          children: [
                            TextSpan(
                              text: "tus coberturas de servicio",
                              style: TextStyle(
                                color: ColorsReemp.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Te ofrecemos mayor alternativas para ofrecer tus servicios profesionales y expandir la cobertura de ellos.',
                        style: TextStyle(
                          color: ColorsReemp.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CircularMenu(
                        sizeCircle: sizeCircle,
                        sizeCircleSelected: sizeCircleSelected,
                        sizeScreen: MediaQuery.of(context).size,
                        onCircleChange: (index) {
                          setState(() {
                            initialIndex = index;
                          });
                        },
                      ),
                      Center(
                        child: Text(
                          titles[initialIndex]!,
                          style: const TextStyle(
                            fontSize: 29,
                            color: ColorsReemp.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Genera encuentros en tus cafés o \ncoworkings favoritos.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsReemp.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'loading');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        ColorsReemp.backgroundButton,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                  ),
                                  child: const Text(
                                    'Configurar',
                                    style: TextStyle(
                                      color: ColorsReemp.blue,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: ColorsReemp.blue,
                                          offset: Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
