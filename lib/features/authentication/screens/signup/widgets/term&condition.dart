import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  static bool rememberme = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Checkbox
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
                value: rememberme,
                onChanged: (value) {
                  setState(() {
                    rememberme = value!;
                  });
                })),
        const SizedBox(width: 10),

        //Text
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '${ECText.agree} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${ECText.privacy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: widget.dark ? ECColors.light : ECColors.primary,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: '${'and'} ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ECText.terms,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: widget.dark ? ECColors.light : ECColors.primary,
                  decoration: TextDecoration.underline))
        ])),
      ],
    );
  }
}
