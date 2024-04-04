import 'package:e_comm_app/features/shop/screens/setting_screem.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ECAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false
    });

    final Widget? title;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final List<Widget>? actions;
    final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: ECSize.md),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow ? IconButton(onPressed: leadingOnPressed, icon: const Icon(Icons.arrow_back))
      : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
    )
    );
  }
  
  @override
  // implement preferredSize
  Size get preferredSize => Size.fromHeight(ECDeviceUtilities.getAppBarHeight());
}