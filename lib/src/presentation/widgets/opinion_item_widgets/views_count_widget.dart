import 'package:flutter/material.dart';

class ViewsCountWidget extends StatelessWidget {
  const ViewsCountWidget({Key? key, required this.viewsCount})
      : super(key: key);
  final int viewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.remove_red_eye_outlined,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          "$viewsCount",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
