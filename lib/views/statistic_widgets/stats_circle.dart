import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/circle_box.dart';
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
  late double strokeWidhtCircle; //TODO: check: it must be less than size
  late Widget icon;
  late double _radius;
  bool _infoShowed = false;

  @override
  void initState() {
    super.initState();

    strokeWidhtCircle = 2.5 * widget.strokeWidth;
    _radius = widget.size;
    //TODO: make a separate widget for icon and ist animation
    icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    double _bigIconSize = size * 0.5;
    double _smallIconSize = _bigIconSize - (_bigIconSize * 0.2);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        hoverColor: _getSecondaryColor(widget.color),
        borderRadius: BorderRadius.circular(squareBoxRadius),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _makeLabel(widget.label),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleBox(color: widget.color, size: size, radius: _radius),
                  CircleBox(
                    color: Colors.white,
                    size: _infoShowed
                        ? size - widget.strokeWidth
                        : size - strokeWidhtCircle,
                    radius: _radius,
                  ),
                  DescriptionBox(
                      size: size,
                      boxPadding: widget.strokeWidth,
                      textSize: descrTextSize,
                      description: widget.description,
                      showText: _infoShowed,
                      offsetBox: EdgeInsets.only(top: 70)),
                  // //TODO: make a separate icon indicator widget where pass icon and infoShowed
                  // _infoShowed
                  //     ? _makeScaleAndMoveupIcon(
                  //         icon, _bigIconSize, _smallIconSize)
                  //     : _makeScaleAndMoveupIcon(
                  //         icon, _smallIconSize, _bigIconSize),
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
      _infoShowed = !_infoShowed;
      _radius = _infoShowed ? squareBoxRadius : widget.size;
      //size = size == _smallIconSize ? 300 : _bigIconSize;
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

Color _getSecondaryColor(Color color) {
  return Color.fromRGBO(
    color.red,
    color.green,
    color.blue,
    color.opacity - 0.8,
  );
}
