import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_const.dart';
import 'package:totem_boschetto/views/info_page/info_tile.dart';
import 'package:totem_boschetto/views/text_style_infopage.dart';

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
  InfoTile(
    label: "Progetto ReMade",
    hintText: "Tocca per scoprire di più",
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset("$imagePath/remade.png", height: 250.0)],
    ),
    detailsView: makeRemadeProjectDetails(),
  ),
];

Widget makeRemadeProjectDetails() {
  return Column(
    children: [
      makeTitle("ReMade"),
      makeParagraph(
          "Il progetto che collega il risparmio della (processo di dematerializzazione) alla piantumazione proporzionale di alberi"),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("images/remade.png", fit: BoxFit.fitWidth),
          Expanded(
            child: Column(
              // align text on left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                makeHeader("OBIETTIVO"),
                makeParagraph(
                  "Attraverso il Progetto ReMade (REplanting for Monitoring Accomplishment of DEmaterialization) l'Ateneo vuole potenziare l'effetto del risparmio di carta prodotto dalla digitalizzazione dei processi amministrativi e di comunicazione. Ad esempio, la stampa delle brochure di AlmaOrienta consumava 13 tonnellate di carta all'anno. Questo risparmio di carta (processo di dematerializzazione) si tradurrà nella piantumazione proporzionale di alberi in giardini dedicati allo scopo. ",
                ),
                makeHeader("ATTIVITÀ"),
                makeParagraph(
                    "Oltre alla piantumazione di nuove alberature, i risultati virtuali (meno carta) e reali (più alberi) saranno diffusi attraverso una web app per affiancare, all'effetto sull'ambiente, un aumento di consapevolezza e competenza da parte della comunità Unibo."),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            makeHeader("Render"),
            Image.asset("/images/render_cesena.jpeg", width: 800),
          ],
        ),
      ),
    ],
  );
}

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
  double? height,
}) {
  return InfoTile(
    cellCountWidth: collSize,
    label: title,
    child: LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height != null
              ? Image.asset(
                  assetImage,
                  height: height,
                )
              : Image.asset(assetImage, width: constraint.maxWidth * 0.8),
        ],
      );
    }),
  );
}
