import 'package:flutter/material.dart';

Widget builder(
  BuildContext context,
  Widget? child,
) {
  if (child != null) {
    child = ScrollConfiguration(
      behavior: const OverScrollBehavior(),
      child: child,
    );
  }

  return child ?? const SizedBox.shrink();
}

class OverScrollBehavior extends ScrollBehavior {
  const OverScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
