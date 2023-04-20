import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_item.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';

var tiles = <GridTileItem>[
  const GridTileItem(
    label: "Come è stata calcolata la $co2String a partire dai fogli di carta?",
    hintText: "Tocca per scoprire di più",
  ),
  const GridTileItem(
    label: "Come sono stati calcolati i litri di benzina?",
    hintText: "Tocca per scoprire di più",
  ),
  const GridTileItem(
    label: "Come è stato calcolata l'energia elettrica?",
    hintText: "Tocca per scoprire di più",
  ),
  GridTileItem(
    cellCountWidth: 2,
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
  const GridTileItem(
    label: "ReMade",
    hintText: "Tocca per scoprire di più",
    child: Text(
      "Il progetto che collega il risparmio della carta (processo di dematerializzazione) alla piantumazione proporzionale di alberi",
      style: TextStyle(fontSize: 26, overflow: TextOverflow.fade),
    ),
  ),
  const GridTileItem(
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
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: GridTileView(
        colCount: 3,
        rowCount: 3,
        tiles: tiles,
      ),
    );
  }
}
