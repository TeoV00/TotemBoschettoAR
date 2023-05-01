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
            color: const Color.fromARGB(64, 0, 0, 0),
            child: Center(
              child: LayoutBuilder(builder: (context, constraint) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: constraint.maxWidth * 0.8,
                        maxHeight: constraint.maxHeight * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              detailsWidget ?? const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _makeCloseDetailsButton(),
                  ],
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

  Widget _makeCloseDetailsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            onPressed: () {
              setState(() => {
                    detailsWidget = null,
                  });
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.close,
                size: 60,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
