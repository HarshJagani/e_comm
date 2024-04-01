import 'package:flutter/material.dart';

class ECBottomSheetTheme{
  ECBottomSheetTheme._();

  static final lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.white,
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    constraints: const BoxConstraints(minWidth: double.infinity),
    modalBackgroundColor: Colors.white,
  );

  static final darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: Colors.black,
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    constraints: const BoxConstraints(minWidth: double.infinity),
    modalBackgroundColor: Colors.black,
  );
}