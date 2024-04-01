import 'package:flutter/material.dart';

import '../../utils/constants/size.dart';

class ECGridLayout extends StatelessWidget {
  const ECGridLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisIntent = 288,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? mainAxisIntent;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisIntent,
          mainAxisSpacing: ECSize.md,
          crossAxisSpacing: ECSize.md,
        ),
        itemBuilder: itemBuilder);
  }
}
