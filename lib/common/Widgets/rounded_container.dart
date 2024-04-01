import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ECRoundedContainer extends StatelessWidget {
  const ECRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.child,
      this.borderColor = Colors.white,
      this.padding,
      this.margin,
      this.radius = 16,
      this.backgroundColor = ECColors.primary,
      this.showBorder = false
      });

  final double? width;
  final double? height;
  final Widget? child;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color backgroundColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
