import 'package:flutter/material.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/content_elements/details_header.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/content_elements/details_user.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/content_elements/level_shelf.dart';

class DetailsContent extends StatelessWidget {
  final SharedData? userData;

  const DetailsContent({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15.0),
      child: Column(
        children: [
          DeatilsHeader(nickname: userData!.nickname),
          LevelShelf(level: userData!.level),
          UserDetails(
            treesCount: userData!.treesCount,
            co2: userData!.co2.toDouble(),
            badgeCount: userData!.badgeCount,
          ),
        ],
      ),
    );
  }
}
