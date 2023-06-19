import 'package:flutter/material.dart';

class DescriptionBox extends StatefulWidget {
  final double size;
  final double boxPadding;
  final double textSize;
  final String description;
  final bool showText;
  final EdgeInsets? offsetBox;

  const DescriptionBox({
    super.key,
    required this.size,
    required this.boxPadding,
    required this.textSize,
    required this.description,
    required this.showText,
    this.offsetBox,
  });

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  @override
  Widget build(BuildContext context) {
    var textBoxSize = widget.size - widget.boxPadding;
    return AnimatedCrossFade(
      firstChild: SizedBox(
        height: textBoxSize,
        width: textBoxSize,
        child: Padding(
          padding: EdgeInsets.all(widget.boxPadding) +
              (widget.offsetBox ?? const EdgeInsets.all(0)),
          child: Text(
            widget.description,
            style: TextStyle(fontSize: widget.textSize),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      secondChild: const SizedBox(),
      crossFadeState: widget.showText
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 400),
    );
  }
}
