import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'user_stars_count_widget.dart';

class LoggedInHomeAppBarWidget extends AppBar {
  LoggedInHomeAppBarWidget()
      : super(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SvgPicture.asset('assets/svgs/qarar-black.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                )),
          ),
          actions: [
            const UserStarsCountWidget(),
          ],
          leading: GestureDetector(
            // onTap: () => appRouter.push(const SavedArticlesView()),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
}
