import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/painting.dart';

class ECSpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: ECSize.appbarHeight,
      left: ECSize.defaultSpace,
      right: ECSize.defaultSpace,
      bottom: ECSize.defaultSpace
   );
}
