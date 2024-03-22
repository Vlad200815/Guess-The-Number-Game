import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.amber[100],
        home: const HomePage(),
        theme: ThemeData(useMaterial3: true));
  }
}
