import 'package:flutter/material.dart';

class StatsCircle extends StatefulWidget {
  const StatsCircle({super.key});

  @override
  State<StatsCircle> createState() => _StatsCircleState();
}

class _StatsCircleState extends State<StatsCircle> {
  //TODO: set this var passing from external
  var color = const Color.fromRGBO(73, 166, 31, 1);
  double size = 230;
  double strokeWidht = 80; //TODO: check: it must be less than size
  Widget icon = Image.asset("/icons/statistics/forest.png", height: 80);
  String label = "ALBERI PIANTATI";

  bool infoShowed = false;
  double radius = 230;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: _getSecondaryColor(color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      onTap: () {
        setState(() {
          infoShowed = !infoShowed;
          radius = infoShowed ? 20.0 : size;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _makeLabel(label),
            Stack(
              alignment: Alignment.center,
              children: [
                _makeCircle(color, size, radius),
                _makeCircle(Colors.white, size - strokeWidht, radius),
                icon,
              ],
            )
          ],
        ),
      ),
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

Widget _makeCircle(Color color, double size, [double? radius]) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color, // border color
      borderRadius: BorderRadius.all(Radius.circular(radius ?? size)),
    ),
  );
}

Color _getSecondaryColor(Color color) {
  return Color.fromRGBO(
    color.red,
    color.green,
    color.blue,
    color.opacity - 0.8,
  );
}
