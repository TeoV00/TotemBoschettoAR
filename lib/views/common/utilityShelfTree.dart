import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/assets_path.dart';

Widget getLevelPicture({required final int level}) {
  String levelPath = "$iconLevelPath$level.png";
  return SizedBox(
    height: 150,
    width: 120,
    child: Image.asset(levelPath),
  );
}
