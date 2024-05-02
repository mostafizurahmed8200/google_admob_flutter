import 'package:flutter/material.dart';
import 'package:google_admob_flutter/screen/google_admob_banner.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    const MyApps(),
  );
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.green, centerTitle: true),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const GoogleAdmobHomepage(),
      },
      initialRoute: '/',
    );
  }
}
