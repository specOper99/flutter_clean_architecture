import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../buttons/default_button.dart';

class LoggedOutHomeAppBarWidget extends AppBar {
  LoggedOutHomeAppBarWidget(context)
      : super(
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 7.5),
              child: SizedBox(
                child: DefaultButton(
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.login,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 10.0, start: 7.5),
            child: SvgPicture.asset(
              'assets/svgs/qarar-black.svg',
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
}
