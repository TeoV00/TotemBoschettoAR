import 'package:flutter/material.dart';

class StatsCircle extends StatefulWidget {
  const StatsCircle({super.key});

  @override
  State<StatsCircle> createState() => _StatsCircleState();
}

class _StatsCircleState extends State<StatsCircle> {
  @override
  Widget build(BuildContext context) {
    //TODO: set this var passing from external
    var _color = const Color.fromRGBO(73, 166, 31, 1);
    double _size = 225;
    Widget _icon = Image.asset("/icons/statistics/forest.png", height: 80);
    String _label = "ALBERI PIANTATI";

    return Column(
      children: [
        _makeLabel(_label),
        Stack(
          alignment: Alignment.center,
          children: [
            _makeCircle(_color, _size),
            _makeCircle(Colors.white, 142),
            _icon,
          ],
        )
      ],
    );
  }
}

Widget _makeLabel(String label) {
  const textSize = 30.0;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
        const Icon(Icons.help_outline, size: textSize),
      ],
    ),
  );
}

Widget _makeCircle(Color color, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color, // border color
      shape: BoxShape.circle,
    ),
  );
}
