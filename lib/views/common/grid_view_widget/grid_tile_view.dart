import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_item.dart';

abstract class GridTileItem {
  int getCellWidth();
  Widget getChild();
}

class GridTileView extends StatelessWidget {
  const GridTileView({
    super.key,
    required this.colCount,
    required this.rowCount,
    required this.tiles,
    required this.tileSpacing,
  });

  final int colCount;
  final int rowCount;
  final double tileSpacing;
  final List<GridTileItem> tiles;

  @override
  Widget build(BuildContext context) {
    List<Widget> tilesRows = [];
    var rowIdxCount = (tiles.length / colCount).ceil();

    return LayoutBuilder(
      builder: (context, constraint) {
        double parentWidht = constraint.maxWidth;
        double parentHeigth = constraint.maxHeight;

        double tileWidth = (parentWidht / colCount) - tileSpacing * 2;
        double tileHeight = (parentHeigth / rowCount);

        List<GridTileItem> singleRow = [];
        for (int row = 0; row < rowIdxCount; row++) {
          int rowCapacity = colCount;
          singleRow = [];
          int skipIdx = 0;
          for (; rowCapacity > 0 && tiles.isNotEmpty;) {
            GridTileItem item = tiles[skipIdx];
            int itemSize = (item.getCellWidth() ?? 1).toInt();
            if (rowCapacity - itemSize >= 0) {
              singleRow.add(item);
              tiles.remove(item);
              rowCapacity = rowCapacity - itemSize;
            } else {
              skipIdx = skipIdx + 1 > tiles.length ? tiles.length : skipIdx + 1;
            }
          }
          tilesRows.add(
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: singleRow
                        .map((tile) => Padding(
                              padding: EdgeInsets.all(tileSpacing),
                              child: SizedBox(
                                height: tileHeight,
                                width: tileWidth * (tile.getCellWidth() ?? 1) -
                                    (tile.getCellWidth() * tileSpacing),
                                child: tile.getChild(),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tilesRows,
            ),
          ),
        );
      },
    );
  }
}