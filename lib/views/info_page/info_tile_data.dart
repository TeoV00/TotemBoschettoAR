import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_tile.dart';

final infoTiles = <GridTileItem>[
  const InfoTile(
    label: "Come è stata calcolata la $co2String a partire dai fogli di carta?",
    hintText: "Tocca per scoprire di più",
  ),
  const InfoTile(
    label: "Come sono stati calcolati i litri di benzina?",
    hintText: "Tocca per scoprire di più",
  ),
  const InfoTile(
    label: "Come è stato calcolata l'energia elettrica?",
    hintText: "Tocca per scoprire di più",
  ),
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
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
  const InfoTile(
    label: "empty",
    hintText: "Tocca per scoprire di più",
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
];
