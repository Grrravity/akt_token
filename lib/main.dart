import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature/akt_token/views/screens/akt_landing_view.dart';
import 'injection_container.dart' as inj;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inj.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(AktApp()));
}

class AktApp extends StatelessWidget {
  const AktApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AktLanding(),
          backgroundColor: Colors.black,
        ));
  }
}
