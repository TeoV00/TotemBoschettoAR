import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/circle_box.dart';
import 'package:totem_boschetto/views/statistic_widgets/description_box.dart';
import 'package:totem_boschetto/views/statistic_widgets/stats_icon.dart';

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
  final String value;

  const StatsCircle(
      {super.key,
      required this.size,
      required this.color,
      required this.strokeWidth,
      required this.icon,
      required this.label,
      required this.description,
      required this.value});

  @override
  State<StatsCircle> createState() => _StatsCircleState();
}

class _StatsCircleState extends State<StatsCircle> {
  late double strokeWidhtCircle; //TODO: check: it must be less than size
  late double _radius;
  bool _infoShowed = false;

  @override
  void initState() {
    super.initState();

    strokeWidhtCircle = 2.5 * widget.strokeWidth;
    _radius = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    double mainIconSize = widget.size * 0.5;
    double secondaryIconSize = (size - widget.strokeWidth) * 0.2;

    /// top padding of secondaryIcon
    double topPaddingIcon = 10.0;

    double elevationPadding = topPaddingIcon / secondaryIconSize;

    /// percentage of elevation for secondaryIcon
    double iconElevation =
        (mainIconSize / secondaryIconSize).floorToDouble() - elevationPadding;

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
              _makeLabel(
                widget.label,
                Icon(_infoShowed ? Icons.cancel_outlined : Icons.help_outline,
                    size: 40),
              ),
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
                    boxPadding: 30,
                    textSize: descrTextSize,
                    description: widget.description,
                    showText: _infoShowed,
                    offsetBox: EdgeInsets.only(
                        top: secondaryIconSize + topPaddingIcon * 2),
                  ),
                  StatsIcon(
                    icon: widget.icon,
                    transition: _infoShowed,
                    mainIconSize: mainIconSize,
                    secondaryIconSize: secondaryIconSize,
                    iconOffset: -iconElevation,
                  ),
                ],
              ),
              const Spacer(),
              _makeLabel(widget.value),
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
    });
  }
}

Widget _makeLabel(String label, [Widget? rightSideWidget]) {
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
        rightSideWidget ?? const SizedBox(),
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
