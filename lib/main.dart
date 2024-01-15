import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(DevicePreview(builder: (context) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.grey[100],
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0),
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: const CardTheme(color: Colors.white, elevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}
