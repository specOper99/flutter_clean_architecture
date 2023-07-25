import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareButtonWidget extends StatelessWidget {
  const ShareButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.arrowshape_turn_up_right,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          AppLocalizations.of(context)!.share,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
