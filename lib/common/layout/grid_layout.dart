import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';

class ECGridLayout extends StatelessWidget {
  const ECGridLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AutoHeightGridView(
      builder: itemBuilder,
      itemCount: itemCount,
      shrinkWrap: true,
    );
  }
}
