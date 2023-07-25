import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsCountWidget extends StatelessWidget {
  const CommentsCountWidget({Key? key,required this.commentsCount}) : super(key: key);
  final int commentsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.chat_bubble,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          "$commentsCount",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
