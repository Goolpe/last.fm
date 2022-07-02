import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  const TextWithButton({
    required this.text,
    required this.textButton,
    required this.onPressed,
    super.key,
  });

  final String text;
  final String textButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          TextButton(
            onPressed: onPressed, 
            child: Text(textButton),
          ),
        ],
      ),
    );
  }
}
