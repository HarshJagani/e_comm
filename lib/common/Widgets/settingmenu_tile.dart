import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.ontap,
      required this.icon,
      required this.title,
      required this.subTitle
      });
  final IconData icon;
  final VoidCallback ontap;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        ontap;
      },
      leading: Icon(
        icon,
        color: ECColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
