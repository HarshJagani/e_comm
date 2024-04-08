import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.leadingText,
    required this.controller,
    this.validator,
    this.text
  });

  final String leadingText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final  String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(leadingText,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis)),
        Expanded(
            flex: 4,
            child: TextFormField(
              validator: validator,
              controller: controller,
              decoration:  const InputDecoration(
                  enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.zero),
                  disabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.zero)),
            )),
      ],
    );
  }
}
