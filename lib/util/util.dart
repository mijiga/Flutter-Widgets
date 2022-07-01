import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

showToast(String title, Toast toastLength) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: toastLength,
    gravity: ToastGravity.BOTTOM,
  );
}

String makePhoneNumber(String phoneNumber) {
  return "+265" + phoneNumber;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
