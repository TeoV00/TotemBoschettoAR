import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_tile.dart';

var tiles = <GridTileItem>[
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

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool showInfoBox = false;

  @override
  Widget build(BuildContext context) {
    // tiles.forEach((infoTile) {
    //   GestureDetector(
    //     child: infoTile,
    //     onTap: ,
    //   );
    // });

    return Stack(
      children: [
        GridTileView(
          colCount: 3,
          rowCount: 3,
          tiles: tiles,
          tileSpacing: 20.0,
        ),
        showInfoBox
            ? Container(
                color: Color.fromARGB(
                    20, 255, 5, 5), //const Color.fromARGB(22, 0, 0, 0),
                child: Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() => {
                                showInfoBox = false,
                              });
                        },
                        child: Text("CHIUDI")),
                  ),
                ),
              )
            : Text(" che dolores"),
      ],
    );
  }
}
