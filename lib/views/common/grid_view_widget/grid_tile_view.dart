import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_item.dart';

class GridTileView extends StatelessWidget {
  const GridTileView({
    super.key,
    required this.colCount,
    required this.rowCount,
    required this.tiles,
  });

  final int colCount;
  final int rowCount;
  final List<GridTileItem> tiles;

  @override
  Widget build(BuildContext context) {
    List<Widget> tilesRows = [];
    var rowIdxCount = (tiles.length / colCount).ceil();

    return LayoutBuilder(
      builder: (context, constraint) {
        double parentWidht = constraint.maxWidth;
        double parentHeigth = constraint.maxHeight;

        double tileSpacing = parentWidht * 0.05;
        double tileWidth = (parentWidht / colCount) - tileSpacing;
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: singleRow
                    .map((tile) => SizedBox(
                          height: tileHeight,
                          width: tileWidth * (tile.cellCountWidth ?? 1),
                          child: tile,
                        ))
                    .toList(),
              ),
            ),
          );
        }

        return Column(
          children: tilesRows,
        );
      },
    );
  }
}
