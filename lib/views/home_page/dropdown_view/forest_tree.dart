import 'package:flutter/material.dart';

class ForestTree extends StatelessWidget {
  final int level;
  const ForestTree({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Image.asset("icons/trees/$level.png");
  }
}
