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
    label: "Come è stata calcolata la $co2String a partire dai fogli di carta?",
    hintText: "Tocca per scoprire di più",
  ),
  const InfoGridTile(
    label: "Come è stata calcolata la $co2String a partire dai fogli di carta?",
    hintText: "Tocca per scoprire di più",
  ),
  InfoGridTile(
    cellCountWidth: 2,
    label:
        "Con questi progetti, l'Ateneo contribuisce agli obiettivi dell'agenda ONU 2030",
    // this tile occupies space of 2 unit tile
    // tileWidth: tileWidth * 2,
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
];

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double parentWidht = constraint.maxWidth;
        double parentHeigth = constraint.maxHeight;

        double tileSpacing = parentWidht * 0.12;
        double tileWidth = (parentWidht / 3) - tileSpacing;
        double tileHeight = (parentHeigth / 3);
        log("w: $parentWidht h: $parentHeigth");

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: tiles
                          .map((tile) => SizedBox(
                                height: tileHeight,
                                width: tileWidth * (tile.cellCountWidth ?? 1),
                                child: tile,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
