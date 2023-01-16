import 'package:flutter/material.dart';
import 'package:reemp/modules/config_service/config_service_page.dart';
import 'package:reemp/modules/welcome/welcome_page.dart';
import 'package:reemp/routes/splash_page.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
      Route route;
      switch (settings.name) {
        case "welcome":
          route = MaterialPageRoute(
            builder: (_) => const WelcomePage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        case "config_service":
          route = MaterialPageRoute(
            builder: (_) => const ConfigServicePage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        default:
          route = MaterialPageRoute(
            builder: (_) => const SplashPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
      }

      return route;
    };
