import 'package:flutter/material.dart';
import 'package:ppstech/resources/colors.dart';
import 'package:ppstech/screen/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorItems.transParent),
        useMaterial3: true,
      ),
      home: const CustomBottomNav(),
    );
  }
}
