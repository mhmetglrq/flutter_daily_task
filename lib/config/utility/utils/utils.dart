import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static void showSnackBar(
      {required BuildContext context,
      required String title,
      required String message,
      Color? color,
      double? messageFontSize,
      double? titleFontSize,
      required ContentType contentType}) {
    final snackBar = SnackBar(
      elevation: 15,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      actionOverflowThreshold: 0.5,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        color: color,
        messageFontSize: messageFontSize,
        titleFontSize: titleFontSize,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
