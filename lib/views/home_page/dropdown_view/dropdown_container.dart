import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/details_content.dart';

const double width = 325.0;
const double expandedHeight = 525.0;
const double reducedHeight = 30.0;
const Radius circularRadius = Radius.circular(12);
const Duration animationDuration = Duration(milliseconds: 300);

BoxDecoration boxStyle = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      bottomLeft: circularRadius, bottomRight: circularRadius), //,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      spreadRadius: 2,
      blurRadius: 30,
    ),
  ],
);

class DropdownContainer extends StatefulWidget {
  final bool showDetails;
  const DropdownContainer({super.key, required this.showDetails});

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  late bool expanded;
  late bool isContentShowing;
  late double height;
  final Widget contentInfo = const DetailsContent(
      nickname: "nickname", level: 4, awareness: 1, badge: 2);

  @override
  void initState() {
    super.initState();
    expanded = true; //widget.showDetails;
    isContentShowing = expanded;
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
          duration: animationDuration,
          onEnd: () {
            setState(() {
              isContentShowing = height >= expandedHeight;
            });
          },
          child:
              isContentShowing ? _makeContent(contentInfo) : const SizedBox(),
        ),
        GestureDetector(
          onTap: () => _toggleVisbility(),
          onLongPress: () {
            debugPrint("long press");
          },
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: expanded ? reducedHeight : expandedHeight,
              end: expanded ? expandedHeight : reducedHeight,
            ),
            curve: Curves.easeIn,
            duration: animationDuration,
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
      isContentShowing = false;
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
