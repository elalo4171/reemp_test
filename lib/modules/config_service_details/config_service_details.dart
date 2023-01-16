import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:reemp/core/assets.dart';
import 'package:reemp/core/colors.dart';
import 'package:reemp/global_widgets/circular_menu_widget.dart';
import 'package:reemp/global_widgets/custom_appbar.dart';
import 'package:reemp/global_widgets/icons_custom.dart';
import 'package:reemp/modules/config_service_details/mod_config.dart';

class ConfigServiceDetails extends StatefulWidget {
  const ConfigServiceDetails({super.key});

  @override
  State<ConfigServiceDetails> createState() => _ConfigServiceDetailsState();
}
// This widget show the details of the service
// and the options to configure the service
// like the modality, the zones, the places
// and the video call

class _ConfigServiceDetailsState extends State<ConfigServiceDetails> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const CustomAppbar(),
            navCutoms(),
            Expanded(
              child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    notModSelected(),
                    const ModConfig(
                      title: "To go",
                      subttitle: "Lleva tu servicio hasta donde tu usuario.",
                      buttonName: "Agregar zonas",
                    ),
                    disableMod(),
                    const ModConfig(
                      title: "Resident",
                      subttitle:
                          "Dispón de tu consultorio u oficina para ofrecer tus servicios.",
                      buttonName: "Agregar consultorios/oficinas",
                    ),
                    videoMod()
                  ]),
            )
          ],
        ),
      ),
    );
  }

  /// This widget show the nav bar
  /// with the options to select the modality
  /// of the services
  Padding navCutoms() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: ColorsReemp.blue.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 9,
              offset: const Offset(0, 0), // changes position of shadow
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
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  _currentPage = 1;
                  setState(() {});
                },
                iconSize: 25,
                isSelectd: _currentPage == 1,
                size: 60,
              ),
              CircularOption(
                icon: Assets.disable,
                onTap: () {
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  _currentPage = 2;
                  setState(() {});
                },
                iconSize: 35,
                size: 60,
                isSelectd: false,
                isEnable: true,
              ),
              CircularOption(
                icon: Assets.resident,
                onTap: () {
                  _pageController.animateToPage(3,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  _currentPage = 3;
                  setState(() {});
                },
                iconSize: 40,
                isSelectd: _currentPage == 3,
                size: 60,
              ),
              CircularOption(
                icon: Assets.work,
                onTap: () {
                  _pageController.animateToPage(4,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  _currentPage = 4;
                  setState(() {});
                },
                iconSize: 36,
                isSelectd: _currentPage == 4,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// This widget show the details of the disable modality
  Padding disableMod() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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
                      text: 'Meeting',
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
                  'Genera encuentros en tus cafés o coworkings favoritos.',
                  style: TextStyle(
                    color: ColorsReemp.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Icon(
              Icons.warning_rounded,
              color: ColorsReemp.white.withOpacity(.5),
              size: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Tenemos temporalmente ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' deshabilitado ',
                        style: TextStyle(
                          color: ColorsReemp.white.withOpacity(.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'esta modalidad para su configuración.',
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
        ],
      ),
    );
  }

  /// This widget show the details of the video modality
  Padding videoMod() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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
                      text: 'Videoconsulta',
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
                  'Realiza tus encuentros a través de video llamadas.',
                  style: TextStyle(
                    color: ColorsReemp.white.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Text(
              'Estado',
              style: TextStyle(
                color: ColorsReemp.grey.withOpacity(.5),
                fontSize: 16,
              ),
            ),
          ),
          const Center(
            child: Text(
              'No disponible',
              style: TextStyle(
                color: ColorsReemp.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 64.0,
            ),
            child: LiteRollingSwitch(
              value: false,
              textOn: '',
              textOff: '',
              colorOff: Colors.black,
              iconOn: Icons.videocam,
              iconOff: Icons.videocam,
              textSize: 16.0,
              onChanged: (bool state) {},
              onSwipe: () {},
              onDoubleTap: () {},
              onTap: () {},
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Desliza hacía la derecha para habilitar las videoconsultas.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  /// This widget show the details of the not modality selected
  Padding notModSelected() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 100,
          ),
          Center(
            child: IconsCustom(
              icon: Assets.info,
              size: 50,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Aún no configuras tus coberturas de servicios',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Elige y configura las modalidades con las que te gustaría disponer de tus servicios y generar encuentros con tus usuarios.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsReemp.grey,
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
