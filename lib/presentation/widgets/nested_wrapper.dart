import 'package:flutter/material.dart';

class NestedWrapper extends StatelessWidget {
  const NestedWrapper({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool value) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(title),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ];
      },
      body: body,
    );
  }
}
