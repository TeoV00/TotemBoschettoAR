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
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "icons/stake.svg",
              height: 65,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(
                  "$iconPath/shelf.svg",
                  height: 52,
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child:
                      SvgPicture.asset("$iconLevelPath$level.svg", width: 120),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 3),
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 15,
                    ),
                    child: Text(
                      "Lv. $level",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
