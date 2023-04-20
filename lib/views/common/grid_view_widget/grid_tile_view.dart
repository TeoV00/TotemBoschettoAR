import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_item.dart';

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
        int idx = 0;
        for (int row = 0; row < rowIdxCount; row++) {
          int rowCapacity = colCount;
          singleRow = [];

          for (; rowCapacity > 0 && idx < tiles.length; idx++) {
            GridTileItem item = tiles[idx];
            int itemSize = (item.cellCountWidth ?? 1).toInt();
            if (rowCapacity - itemSize >= 0) {
              singleRow.add(item);
              rowCapacity = rowCapacity - itemSize;
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
                                width: tileWidth * (tile.cellCountWidth ?? 1) -
                                    (tile.cellCountWidth ?? 1 * tileSpacing),
                                child: tile,
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
