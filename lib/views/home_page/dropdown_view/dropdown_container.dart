import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/model/user_data.dart';
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
  bool showDetails;
  final UserData? userData;
  DropdownContainer({
    super.key,
    required this.showDetails,
    this.userData,
  });

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  late bool expanded;
  late bool isContentShowing;
  @override
  void initState() {
    super.initState();
    expanded = widget.showDetails;
    isContentShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!expanded && widget.showDetails) {
      _openContainer();
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
          width: width,
          height: expanded ? expandedHeight : reducedHeight,
          decoration: boxStyle,
          duration: animationDuration,
          onEnd: () {
            setState(() {
              isContentShowing = true; //height >= expandedHeight;
            });
          },
          child: isContentShowing
              ? _makeContent(widget.userData)
              : const SizedBox(),
        ),
        GestureDetector(
          onTap: () => expanded ? _closeContainer() : _openContainer(),
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

  void _openContainer() {
    setState(() {
      expanded = true;
      isContentShowing = false;
    });
  }

  void _closeContainer() {
    widget.showDetails = false;
    setState(() {
      expanded = false;
      isContentShowing = false;
    });
  }

  Widget _makeContent(UserData? userData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          userData != null
              ? DetailsContent(
                  userData: userData,
                )
              : const Text("NESSUN ALBERO SELEZIONATO"),
          const Spacer(),
          MaterialButton(
            onPressed: _closeContainer,
            color: Colors.green[100],
            child: const Text("CHIUDI"),
          ),
        ],
      ),
    );
  }
}
