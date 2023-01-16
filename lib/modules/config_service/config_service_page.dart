import 'package:flutter/material.dart';

class ConfigServicePage extends StatelessWidget {
  const ConfigServicePage({super.key});

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
                  left: 20,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
