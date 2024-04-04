import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.leadingText,
    required this.icon,
    required this.title,
    required this.ontap,
  });
  final String leadingText;
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text(leadingText, style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis)),
        Expanded(flex: 5,child: Text(title, style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis)),
        IconButton(icon: Icon(icon), onPressed: ontap)
      ],
    );
  }
}
