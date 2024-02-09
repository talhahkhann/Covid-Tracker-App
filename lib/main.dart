import 'package:covid_app/View/splash_screen.dart';
import 'package:covid_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'package:random_color_scheme/random_color_scheme.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:covid_app/Themes/theme.dart';


void main()async {
  runApp(
      EasyDynamicThemeWidget(child: const MyApp() )
     );
}

class MyApp extends StatelessWidget {
  final String title = 'EDT - Example';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: darkThemeData,
      darkTheme: lightThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: const SplashScreen(),
    );
  }
}
