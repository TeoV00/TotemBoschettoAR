import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/navigation_rail_menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NavRailMenu(),
      ),
      title: "Totem Boschetto",
    );
  }
}
