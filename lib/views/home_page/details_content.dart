import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/views/home_page/home_utils.dart';

class DetailsContent extends StatelessWidget {
  final String nickname;
  final int level;
  final int awareness;
  final int badge;

  const DetailsContent(
      {super.key,
      required this.nickname,
      required this.level,
      required this.awareness,
      required this.badge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "icons/stake.svg",
              height: 65,
            ),
            Text(
              nickname,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "icons/stake.svg",
              height: 65,
            )
          ],
        ),
        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  SvgPicture.asset("$iconPath/shelf.svg"),
                  SvgPicture.asset("$iconLevelPath$level.svg", width: 120),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
