import 'package:flutter/material.dart';

class ECSectionHeading extends StatelessWidget {
  const ECSectionHeading({
    super.key,
    required this.text,
    required this.buttonText,
    this.onPressed,
    this.textColor,
     required this.padding
  });

  final String text;
  final String buttonText;
  final void Function()? onPressed;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          TextButton(onPressed: () {}, child: Text(buttonText))
        ],
      ),
    );
  }
}
