import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/info_page/info_grid_tile.dart';

var tiles = <InfoGridTile>[
  const InfoGridTile(
    label: "Come è stata calcolata la $co2String a partire dai fogli di carta?",
    hintText: "Tocca per scoprire di più",
  ),
  const InfoGridTile(
    label: "Come sono stati calcolati i litri di benzina?",
    hintText: "Tocca per scoprire di più",
  ),
  const InfoGridTile(
    label: "Come è stato calcolata l'energia elettrica?",
    hintText: "Tocca per scoprire di più",
  ),
  InfoGridTile(
    cellCountWidth: 1,
    label:
        "Con questi progetti, l'Ateneo contribuisce agli obiettivi dell'agenda ONU 2030",
    child: LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "$imagePath/sdg_remade.png",
            width: constraint.maxWidth,
          ),
        ],
      );
    }),
  ),
  const InfoGridTile(
    label: "ReMade",
    hintText: "Tocca per scoprire di più",
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
  const InfoGridTile(
    label: "empty",
    hintText: "Tocca per scoprire di più",
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
];

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const colCount = 3;
    const rowCount = 3;
    var rowIdxCount = (tiles.length / colCount).ceil();
    log("righe: ${rowIdxCount.toString()}");

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: LayoutBuilder(
        builder: (context, constraint) {
          double parentWidht = constraint.maxWidth;
          double parentHeigth = constraint.maxHeight;

          double tileSpacing = parentWidht * 0.05;
          double tileWidth = (parentWidht / colCount) - tileSpacing;
          double tileHeight = (parentHeigth / rowCount);
          log("w: $parentWidht h: $parentHeigth");

          List<Widget> listRows = [];
          for (int row = 0; row < rowIdxCount; row++) {
            int start = row * colCount;
            int end = (row * colCount) + colCount;

            listRows.add(
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: tiles
                      .getRange(start, end)
                      .map((tile) => SizedBox(
                            height: tileHeight,
                            width: tileWidth * (tile.cellCountWidth ?? 1),
                            child: tile,
                          ))
                      .toList(),
                ),
              ),
            );
          }

          return Column(
            children: listRows,
          );
        },
      ),
    );
  }
}
