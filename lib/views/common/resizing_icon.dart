import 'package:flutter/material.dart';

const defaultDuration = Duration(milliseconds: 400);

/// Animated resizing icon that move from mainIconSize to secondaryIconSize and move up of iconOffset
/// [iconOffset] final vertical offset. Value indicates how many [iconOffset ]* [secondaryOffset] pixels
class ResizingIcon extends StatefulWidget {
  final Widget icon;
  final double mainIconSize;
  final double secondaryIconSize;
  final double iconOffset;
  final bool runTransition;
  final Duration? duration;

  const ResizingIcon({
    super.key,
    required this.icon,
    required this.mainIconSize,
    required this.secondaryIconSize,
    required this.runTransition,
    required this.iconOffset,
    this.duration,
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
    _updateAnimationValues(widget.runTransition);

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: animationStart, end: animationStop),
      duration: widget.duration ?? defaultDuration,
      builder: (context, size, child) {
        return AnimatedSlide(
          duration: widget.duration ?? defaultDuration,
          offset: Offset(0.0, widget.runTransition ? widget.iconOffset : 0.0),
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
