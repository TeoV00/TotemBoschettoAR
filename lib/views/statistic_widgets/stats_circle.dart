import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/description_box.dart';

const squareBoxRadius = 20.0;
const descrTextSize = 22.0;
//Nice animation alternatives Curves.ease, Curves.bounceOut or Curves.elasticOut;
const Curve curveAnimation = Curves.ease;

const Duration animationDuration = Duration(milliseconds: 400);

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
  late double _bigIconSize;
  late double _smallIconSize;

  bool infoShowed = false;
  double radius = 230;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    size = widget.size;
    label = widget.label;
    strokeWidht = 2 * widget.strokeWidth;
    //TODO: make a separate widget for icon and ist animation
    icon = widget.icon;
    _bigIconSize = size - 150;
    _smallIconSize = _bigIconSize - (_bigIconSize * 0.2);
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
                      infoShowed
                          ? size - widget.strokeWidth
                          : size - strokeWidht,
                      radius),
                  DescriptionBox(
                      size: size,
                      boxPadding: widget.strokeWidth,
                      textSize: descrTextSize,
                      description: widget.description,
                      showText: infoShowed,
                      offsetBox: EdgeInsets.only(top: _smallIconSize)),
                  //TODO: make a separate icon indicator widget where pass icon and infoShowed
                  infoShowed
                      ? _makeScaleAndMoveupIcon(
                          icon, _bigIconSize, _smallIconSize)
                      : _makeScaleAndMoveupIcon(
                          icon, _smallIconSize, _bigIconSize),
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

Widget _makeScaleAndMoveupIcon(
  Widget icon,
  double startSize,
  double finalSize,
) {
  return TweenAnimationBuilder(
    tween: Tween<double>(begin: startSize, end: finalSize),
    duration: animationDuration,
    builder: (context, size, child) {
      return AnimatedSlide(
        duration: animationDuration,
        offset: Offset(0.0, startSize < finalSize ? 0.0 : -1.3),
        child: SizedBox(
          height: size,
          width: size,
          child: icon,
        ),
      );
    },
  );
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
            overflow: TextOverflow.fade,
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
  return AnimatedContainer(
    curve: curveAnimation,
    duration: const Duration(milliseconds: 400),
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
