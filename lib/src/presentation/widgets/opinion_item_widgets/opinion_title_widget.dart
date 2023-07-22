import 'package:flutter/material.dart';

class OpinionTitleWidget extends StatelessWidget {
  const OpinionTitleWidget(
      {Key? key, required this.opinionTitle, this.isGridItem = false})
      : super(key: key);
  final String opinionTitle;
  final isGridItem;

  @override
  Widget build(BuildContext context) {
    return Text(
      opinionTitle,
      textAlign: TextAlign.center,
      maxLines: isGridItem ? 3 : null,
      overflow: isGridItem ? TextOverflow.ellipsis : null,
      style: const TextStyle(
        fontFamily: "Ping AR + LT",
        fontWeight: FontWeight.w900,
        fontSize: 22,
        color: Colors.black87,
      ),
    );
  }
}
