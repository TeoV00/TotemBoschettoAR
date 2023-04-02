
import 'package:flutter/material.dart';

/// Animated resizing icon that move from mainIconSize to secondaryIconSize and move up of iconOffset
class ResizingIcon extends StatefulWidget {
  final Widget icon;
  final double mainIconSize;
  final double secondaryIconSize;
  final double iconOffset;
  final bool transition;
  const ResizingIcon({
    super.key,
    required this.icon,
    required this.mainIconSize,
    required this.secondaryIconSize,
    required this.transition,
    required this.iconOffset,
  });

  @override
  State<StatefulWidget> createState() => _ResizingIconState();
}

class _ResizingIconState extends State<ResizingIcon> {
  late double animationStart;
  late double animationStop;

  @override
  void initState() {
    super.initState();
    animationStart = widget.mainIconSize;
    animationStop = widget.secondaryIconSize;
  }

  @override
  Widget build(BuildContext context) {
    _updateAnimationValues(widget.transition);

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: animationStart, end: animationStop),
      duration: const Duration(milliseconds: 400),
      builder: (context, size, child) {
        return AnimatedSlide(
          duration: const Duration(milliseconds: 400),
          offset: Offset(0.0, widget.transition ? widget.iconOffset : 0.0),
          child: SizedBox(
            height: size,
            width: size,
            child: widget.icon,
          ),
        );
      },
    );
  }

  void _updateAnimationValues(bool runAnimation) {
    setState(() {
      if (runAnimation) {
        animationStart = widget.mainIconSize;
        animationStop = widget.secondaryIconSize;
      } else {
        animationStart = widget.secondaryIconSize;
        animationStop = widget.mainIconSize;
      }
    });
  }
}
