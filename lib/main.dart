import 'package:calendlio/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:calendlio/pages/register.dart';
import 'package:calendlio/pages/login.dart';

Future main() async {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  Constants.prefs = await SharedPreferences.getInstance();
  Constants.auth_token = await SharedPreferences.getInstance();
  runApp(Calendlio());
}

class Calendlio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendlio',
      theme: ThemeData(primaryColor: Colors.purple),
      routes: {
        "/register": (context) => Register(),
        "/login": (context) => Login()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calendlio',
            style: GoogleFonts.acme(fontSize: 25.0, letterSpacing: 1.01),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Login(),
      ),
    );
  }
}
