import 'package:flutter/material.dart';

const textBorder = 20;
const squareBoxRadius = 20.0;
const descrTextSize = 22.0;
const iconSize = 80.0;

class StatsCircle extends StatefulWidget {
  final double size;
  final Color color;
  final double strokeWidth;
  final Widget icon;
  final String label;
  final String description;

  const StatsCircle(
      {super.key,
      required this.size,
      required this.color,
      required this.strokeWidth,
      required this.icon,
      required this.label,
      required this.description});

  @override
  State<StatsCircle> createState() => _StatsCircleState();
}

class _StatsCircleState extends State<StatsCircle> {
  late Color color;
  late double size;
  late double strokeWidht; //TODO: check: it must be less than size
  late Widget icon;
  late String label;
  late String description;

  bool infoShowed = false;
  double radius = 230;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    size = widget.size;
    strokeWidht = 2 * widget.strokeWidth;
    icon = widget.icon;
    label = widget.label;
    description = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        hoverColor: _getSecondaryColor(color),
        borderRadius: BorderRadius.circular(squareBoxRadius),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _makeLabel(label),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  _makeCircle(color, size, radius),
                  _makeCircle(
                      Colors.white,
                      infoShowed ? size - textBorder : size - strokeWidht,
                      radius),
                  infoShowed
                      ? SizedBox(
                          height: size - textBorder,
                          width: size - textBorder,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              description,
                              style: const TextStyle(fontSize: descrTextSize),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : icon,
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
        onTap: () => _toggleVisibility(),
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      infoShowed = !infoShowed;
      radius = infoShowed ? squareBoxRadius : size;
      size = size == 230 ? 300 : 230;
    });
  }
}

Widget _makeLabel(String label) {
  const textSize = 30.0;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
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
