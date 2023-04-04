import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double width = 325.0;
const double expandedHeight = 525.0;
const double reducedHeight = 50.0;

BoxDecoration boxStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      spreadRadius: 2,
      blurRadius: 30,
    ),
  ],
);

class DetailsBox extends StatefulWidget {
  final bool showDetails;
  const DetailsBox({super.key, required this.showDetails});

  @override
  State<DetailsBox> createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<DetailsBox> {
  late bool expanded;
  late double height;
  final Widget contentInfo = const Text("content data");

  @override
  void initState() {
    super.initState();
    expanded = widget.showDetails;
    height = expanded ? expandedHeight : reducedHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
          width: width,
          height: height,
          decoration: boxStyle,
          duration: const Duration(milliseconds: 300),
          child: expanded ? _makeContent(contentInfo) : const SizedBox(),
        ),
        GestureDetector(
          onTap: () => _toggleVisbility(),
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: expanded ? reducedHeight : expandedHeight,
              end: expanded ? expandedHeight : reducedHeight,
            ),
            duration: const Duration(milliseconds: 300),
            builder: (BuildContext context, double animHeight, child) {
              return Padding(
                padding: EdgeInsets.only(top: animHeight - 25),
                child: SvgPicture.asset("images/info_rope.svg"),
              );
            },
          ),
        ),
      ],
    );
  }

  void _toggleVisbility() {
    setState(() {
      expanded = !expanded;
      height = expanded ? expandedHeight : reducedHeight;
    });
  }

  Widget _makeContent(Widget userInfoContent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          userInfoContent,
          const Spacer(),
          MaterialButton(
            onPressed: _toggleVisbility,
            color: Colors.green[100],
            child: const Text("CHIUDI"),
          ),
        ],
      ),
    );
  }
}
