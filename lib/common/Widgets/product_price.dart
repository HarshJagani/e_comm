import 'package:flutter/material.dart';

class ECProductPrice extends StatelessWidget {
  const ECProductPrice(
      {super.key,
      this.currencySign = '\$',
      required this.price,
      this.isLarge = false,
      this.lineThrough = false});

  final String currencySign, price;
  final bool isLarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}
