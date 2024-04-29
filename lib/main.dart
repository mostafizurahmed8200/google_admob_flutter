import 'package:flutter/material.dart';
import 'package:google_admob_flutter/screen/google_admob_banner.dart';

void main() {
  runApp() => const MyApps();
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.green,
      ),
      debugShowCheckedModeBanner: true,
      routes: {
        '/': (context) => const GoogleAdmobHomepage(),
      },
      initialRoute: '/',
    );
  }
}
