import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/resizing_icon.dart';
import 'package:totem_boschetto/views/statistic_widgets/circle_box.dart';
import 'package:totem_boschetto/views/statistic_widgets/description_box.dart';

const squareBoxRadius = 10.0;

//Nice animation alternatives Curves.ease, Curves.bounceOut or Curves.elasticOut;
const Curve curveAnimation = Curves.ease;
const Duration animationDuration = Duration(milliseconds: 400);

class StatsCircle extends StatefulWidget {
  final double? size;
  final Color color;
  final double? strokeWidth;
  final Widget icon;
  final String label;
  final String description;
  final String value;

  const StatsCircle(
      {super.key,
      this.size,
      required this.color,
      this.strokeWidth,
      required this.icon,
      required this.label,
      required this.description,
      required this.value});

  @override
  State<StatsCircle> createState() => _StatsCircleState();
}

class _StatsCircleState extends State<StatsCircle> {
  bool _infoShowed = false;
  late double radius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraint) {
        double size = constraint.maxWidth * 0.6;
        double strokeWidth = size * 0.1;
        double strokeWidhtCircle = 2.5 * strokeWidth;
        radius = _infoShowed ? squareBoxRadius : (widget.size ?? size);
        double mainIconSize = size * 0.4;
        double secondaryIconSize = (size - strokeWidth) * 0.2;

        /// top padding of secondaryIcon
        double topPaddingIcon = 10.0;
        double elevationPadding = topPaddingIcon / secondaryIconSize;

        /// percentage of elevation for secondaryIcon
        double iconElevation =
            (mainIconSize / secondaryIconSize).floorToDouble() -
                elevationPadding;

        double labelTextSize = mainIconSize * 0.20;
        double descrTextSize = labelTextSize * 0.8;

        double descrPadding = size * 0.1;

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
                  const Spacer(),
                  _makeLabel(
                    widget.label,
                    labelTextSize,
                    Icon(
                        _infoShowed
                            ? Icons.cancel_outlined
                            : Icons.help_outline,
                        size: labelTextSize),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleBox(
                          color: widget.color, size: size, radius: radius),
                      CircleBox(
                        color: Colors.white,
                        size: _infoShowed
                            ? size - strokeWidth
                            : size - strokeWidhtCircle,
                        radius: radius,
                      ),
                      DescriptionBox(
                        size: size,
                        boxPadding: descrPadding,
                        textSize: descrTextSize,
                        description: widget.description,
                        showText: _infoShowed,
                        offsetBox: EdgeInsets.only(
                            top: secondaryIconSize + topPaddingIcon * 1.5),
                      ),
                      ResizingIcon(
                        icon: widget.icon,
                        runTransition: _infoShowed,
                        mainIconSize: mainIconSize,
                        secondaryIconSize: secondaryIconSize,
                        iconOffset: -iconElevation,
                      ),
                    ],
                  ),
                  const Spacer(),
                  _makeLabel(widget.value, labelTextSize),
                  const Spacer(),
                ],
              ),
            ),
            onTap: () => {
              setState(() {
                _infoShowed = !_infoShowed;
                radius = _infoShowed ? squareBoxRadius : size;
              }),
            },
          ),
        );
      },
    );
  }
}

Widget _makeLabel(String label, double textSize, [Widget? rightSideWidget]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: Text(
            label,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
        rightSideWidget ?? const SizedBox(),
        const Spacer(),
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
