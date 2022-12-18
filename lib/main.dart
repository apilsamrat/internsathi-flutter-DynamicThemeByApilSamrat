import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timed_greetings/layouts/home.dart';
import 'package:timed_greetings/provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (_) => DynamicTheming(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<DynamicTheming>(context).getTheme(),
      home: const HomePage(),
    );
  }
}
