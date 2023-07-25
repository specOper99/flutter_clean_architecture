import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isFilled = false,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final isFilled;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => onPressed(),
      child: Text(text),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 0,
        backgroundColor: isFilled
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: isFilled
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
