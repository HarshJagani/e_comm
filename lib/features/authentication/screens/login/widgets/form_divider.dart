import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ECFormDivider extends StatelessWidget {
  const ECFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? Colors.grey.shade500 : Colors.grey.shade700,
            thickness: 0.5,
            indent: 40,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? Colors.grey.shade500 : Colors.grey.shade700,
            thickness: 0.5,
            indent: 5,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}
