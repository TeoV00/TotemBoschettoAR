import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const grassHeight = 48.0;

class BottomGrass extends StatelessWidget {
  final Widget child;
  const BottomGrass({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(child: child),
          LayoutBuilder(builder: ((context, constraints) {
            var parentWidth = constraints.maxWidth;
            return SizedBox(
              width: parentWidth,
              height: grassHeight,
              child: SvgPicture.asset(
                'images/grass.svg',
                excludeFromSemantics: true,
                fit: BoxFit.fill,
              ),
            );
          }))
        ],
      ),
    );
  }
}
