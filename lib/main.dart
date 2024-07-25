import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindbox/assest/renk/color.dart';
import 'package:mindbox/screen/home_screen.dart';
import 'package:mindbox/screen/loading_screen.dart';
import 'package:mindbox/screen/profil_Screen.dart';
import 'package:mindbox/screen/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness:Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindBox',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        hintColor: AppColors.accentColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
                builder: (context) => const LoadingScreen());
          case "/home":
            return MaterialPageRoute(builder: (context) => const Home());
          case "/profilscreen":
            return MaterialPageRoute(
                builder: (context) => const ProfilScreen());
          case "/settingscreen":
            return MaterialPageRoute(
                builder: (context) => const SettingScreen());
        }
      },
      initialRoute: "/",
    );
  }
}
