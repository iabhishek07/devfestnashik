import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_nashik/config/config_page.dart';
import 'package:gdg_nashik/utils/devfest.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  DevFest.prefs = await SharedPreferences.getInstance();

  runApp(ConfigPage());
}

