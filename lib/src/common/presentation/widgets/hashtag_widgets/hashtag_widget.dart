// This file contains the HashtagWidget widget which is used to display a hashtag
// inside a box with a background color and a text.

import 'package:flutter/cupertino.dart';

class HashtagWidget extends StatelessWidget {
  final String hashtag;
  final Color backgroundColor;
  final Color textColor;

  const HashtagWidget({
    Key? key,
    required this.hashtag,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: backgroundColor,
      child: Text(
        hashtag,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
