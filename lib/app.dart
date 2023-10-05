import 'package:assignment_five_flutter/screens/home_screen.dart';
import 'package:assignment_five_flutter/screens/splash.dart';
import 'package:assignment_five_flutter/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomeScreen.routeName :(_) => const HomeScreen(),
        Splash.routeName :(_) => const Splash()},
      initialRoute: HomeScreen.routeName,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
