import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void showToast(String message, BuildContext? context) {
  GFToast.showToast(
    message,
    context!,
    toastPosition: GFToastPosition.BOTTOM,
    toastBorderRadius: 10.0,
  );
}
