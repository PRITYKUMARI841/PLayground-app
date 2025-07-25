import 'package:flutter/material.dart';
import 'package:groundapp/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ground Booking App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
