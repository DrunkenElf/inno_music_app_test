import 'package:flutter/material.dart';

class AnimatedPageWrapper extends StatelessWidget {
  final Widget child;

  const AnimatedPageWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInExpo,
      switchOutCurve: Curves.easeOutExpo,
      duration: Duration(milliseconds: 300),
      child: child,
    );
  }
}
