import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_const.dart';
import 'package:totem_boschetto/views/info_page/info_tile.dart';

final infoTiles = <GridTileItem>[
  makeInfoTile(0),
  makeInfoTile(1),
  makeInfoTile(2),
  makeImageInfoTile(
    title:
        "Con questi progetti, l'Ateneo contribuisce agli obiettivi dell'agenda ONU 2030",
    collSize: 2,
    assetImage: "$imagePath/sdg_remade.png",
  ),
  makeImageInfoTile(
    title: "Progetto ReMade",
    collSize: 1,
    assetImage: "$imagePath/remade.png",
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
    detailsView: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Text(body,
            style: const TextStyle(
              fontSize: 26,
            )),
      ],
    ),
  );
}

InfoTile makeImageInfoTile({
  required String title,
  required int collSize,
  required String assetImage,
}) {
  return InfoTile(
    cellCountWidth: collSize,
    label: title,
    child: LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetImage, width: constraint.maxWidth * 0.8),
        ],
      );
    }),
  );
}
