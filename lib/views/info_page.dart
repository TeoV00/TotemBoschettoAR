import 'package:flutter/material.dart';
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
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    detailsWidget ?? const SizedBox(),
                    TextButton(
                        onPressed: () {
                          setState(() => {
                                detailsWidget = null,
                              });
                        },
                        child: const Text("CHIUDI")),
                  ],
                ),
              ),
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
