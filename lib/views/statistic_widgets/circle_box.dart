import 'package:flutter/material.dart';

class CircleBox extends StatefulWidget {
  final Color color;
  final double size;
  final double radius;

  const CircleBox(
      {super.key,
      required this.color,
      required this.size,
      required this.radius});

  @override
  State<StatefulWidget> createState() => CircleBoxState();
}

class CircleBoxState extends State<CircleBox> {
  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 400),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: widget.color, // border color
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      ),
    );
  }
}
