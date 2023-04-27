import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_const.dart';
import 'package:totem_boschetto/views/info_page/info_tile.dart';

final infoTiles = <GridTileItem>[
  makeInfoTile(0),
  makeInfoTile(1),
  makeInfoTile(2),
  InfoTile(
    cellCountWidth: 2,
    label:
        "Con questi progetti, l'Ateneo contribuisce agli obiettivi dell'agenda ONU 2030",
    child: LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "$imagePath/sdg_remade.png",
            width: 600,
          ),
        ],
      );
    }),
  ),
  const InfoTile(
    label: "ReMade",
    hintText: "Tocca per scoprire di più",
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
  const InfoTile(
    label: "empty",
    hintText: "Tocca per scoprire di più",
    cellCountWidth: 3,
    child: Text(
      "lla carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
];

InfoTile makeInfoTile(int idxInfo) {
  final infoData = infoSections[idxInfo];
  String title = infoData['title'] ?? '';
  String body = infoData['body'] ?? '';
  return InfoTile(
    label: title,
    hintText: "Tocca per scoprire di più",
    detailsView: Column(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      Text(body,
          style: const TextStyle(
            fontSize: 26,
          )),
    ]),
  );
}
