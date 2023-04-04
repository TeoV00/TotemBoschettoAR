import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/home_page/content_elements/details_header.dart';
import 'package:totem_boschetto/views/home_page/content_elements/level_shelf.dart';

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
      child: Column(
        children: [
          DeatilsHeader(nickname: nickname),
          LevelShelf(level: level),
        ],
      ),
    );
  }
}
