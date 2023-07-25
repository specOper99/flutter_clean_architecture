import 'package:flutter/material.dart';

class VotesCountWidget extends StatelessWidget {
  const VotesCountWidget({Key? key, required this.votesCount})
      : super(key: key);
  final int votesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.done_all,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          "$votesCount",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
