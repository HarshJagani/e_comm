import 'package:flutter/material.dart';

class ECProductTitle extends StatelessWidget {
  const ECProductTitle(
      {super.key,
      required this.productTitle,
      this.textAlign,
      this.maxLines = 2});

  final String productTitle;
  final TextAlign? textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(productTitle,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: textAlign,
        maxLines: maxLines);
  }
}
