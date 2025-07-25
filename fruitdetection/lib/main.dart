import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruitdetection/screens/fruitpic.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: Fruitpic()),
      debugShowCheckedModeBanner: false,
      title: 'Fruit Detection',
      
    );
  }
}
