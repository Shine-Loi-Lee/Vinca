import 'package:flutter/material.dart';

pushNavigator({
  required BuildContext context,
  required Widget page,
}) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

replaceNavigator({
  required BuildContext context,
  required Widget page,
}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

popNavigator({
  required BuildContext context,
}) {
  return Navigator.pop(context);
}

pushAndRemoveNavigator({
  required BuildContext context,
  required Widget page,
}) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}
