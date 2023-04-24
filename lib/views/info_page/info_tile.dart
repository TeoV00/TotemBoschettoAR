import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/grid_view_widget/grid_tile_view.dart';

const labelTileStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

const hintStyle = TextStyle(
  fontSize: 20,
);

class InfoTile implements GridTileItem {
  final String label;
  final Widget? child;
  final String? hintText;
  final Color? color;
  final int? cellCountWidth;

  const InfoTile({
    required this.label,
    this.hintText,
    this.color,
    this.child,
    this.cellCountWidth,
  });

  @override
  int getCellWidth() {
    return cellCountWidth ?? 1;
  }

  @override
  Widget getChild() {
    return Container(
      decoration: BoxDecoration(
        color: color ?? const Color.fromRGBO(243, 243, 243, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: labelTileStyle,
            ),
            if (child != null) ...[child!],
            if (hintText != null) ...[Text(hintText!, style: hintStyle)],
          ],
        ),
      ),
    );
  }
}
