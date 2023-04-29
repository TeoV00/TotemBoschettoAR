import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/views/common/assets_path.dart';

class LevelShelf extends StatelessWidget {
  const LevelShelf({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: _getLevelPicture(level: level),
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
                    fontSize: 22,
                  ),  
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getLevelPicture({required final int level}) {
    String levelPath = "$iconLevelPath$level.png";
    return SizedBox(
      height: 150,
      width: 120,
      child: Image.asset(levelPath),
    );
  }
}
