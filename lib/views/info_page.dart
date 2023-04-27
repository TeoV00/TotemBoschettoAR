import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';
import 'package:totem_boschetto/views/info_page/info_tile_data.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> implements GridViewNotifier {
  Widget? detailsWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridTileView(
          colCount: 3,
          rowCount: 3,
          tiles: infoTiles,
          tileSpacing: 20.0,
          listener: this,
        ),
        if (detailsWidget != null) ...[
          Container(
            color: const Color.fromARGB(22, 0, 0, 0),
            child: Center(
              child: LayoutBuilder(builder: (context, constraint) {
                return Container(
                  constraints: BoxConstraints(
                    maxWidth: constraint.maxWidth * 0.8,
                    maxHeight: constraint.maxHeight * 0.5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        detailsWidget ?? const SizedBox(),
                        TextButton(
                            onPressed: () {
                              setState(() => {
                                    detailsWidget = null,
                                  });
                            },
                            child: const Text(
                              "CHIUDI",
                              style: TextStyle(fontSize: 25, color: mainColor),
                            )),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ],
    );
  }

  @override
  void notifyTileTapped(Widget? detailsView) {
    setState(() {
      detailsWidget = detailsView;
    });
  }
}
