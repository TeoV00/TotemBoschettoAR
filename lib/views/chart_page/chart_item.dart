
import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';

class ChartItem extends StatelessWidget {
  final int position;
  final String nickname;

  const ChartItem({super.key, required this.position, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            width: 440,
            height: 102,
            decoration: const BoxDecoration(
                boxShadow: [boxShadowBottom],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(243, 243, 243, 1)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "$position°",
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    nickname,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          if (position > 0 && position < 4) ...[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                '$iconsPath/medals/medal-$position.png',
                height: 115,
              ),
            )
          ]
        ],
      ),
    );
  }
}
