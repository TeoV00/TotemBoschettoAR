import 'package:flutter/material.dart';

class StatsIcon extends StatefulWidget {
  final Widget icon;
  final double parentSize;
  final bool transition;
  const StatsIcon(
      {super.key,
      required this.icon,
      required this.parentSize,
      required this.transition});

  @override
  State<StatefulWidget> createState() => _StatsIconState();
}

class _StatsIconState extends State<StatsIcon> {
  late final double bigIconSize;
  late final double smallIconSize;
  late double animationStart;
  late double animationStop;

  @override
  void initState() {
    super.initState();
    bigIconSize = widget.parentSize * 0.5;
    smallIconSize = bigIconSize - (bigIconSize * 0.2);
    animationStart = bigIconSize;
    animationStop = smallIconSize;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.transition) {
      // transition ->> true means show descrption
      setState(() {
        animationStart = bigIconSize;
        animationStop = smallIconSize;
      });
    }
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: animationStart, end: animationStop),
      duration: const Duration(milliseconds: 400),
      builder: (context, size, child) {
        return AnimatedSlide(
          duration: const Duration(milliseconds: 400),
          offset: Offset(0.0, animationStart < animationStop ? 0.0 : -1.3),
          child: SizedBox(
            height: size,
            width: size,
            child: widget.icon,
          ),
        );
      },
    );
    ;
  }
}
