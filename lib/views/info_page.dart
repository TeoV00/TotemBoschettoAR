import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var sections = <Widget>[
  /*makeTitle("ReMade"),
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
  makeHeader("Render"),
  Image.asset("/images/render_cesena.jpeg"),
  Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      children: [
        makeParagraph(
            "Con questo progetto L'università di Bologna constribuisce algi obbiettivi dell' Agenda ONU 2030"),
        Image.asset("/images/sdg_remade.png")
      ],
    ),
  ),*/
];

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.black,
                    height: 40,
                    width: 80,
                  ),
                  Container(
                    color: Colors.red,
                    height: 40,
                    width: 80,
                  ),
                ],
              ),
            )
          ],
        ),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
