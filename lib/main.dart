import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/navigation_menu/navigation_rail_menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: const Scaffold(
        body: NavRailMenu(),
      ),
      title: "Totem Boschetto",
    );
  }
}
