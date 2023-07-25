import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:intl/intl.dart' as INTL;

import '../../../common/presentation/widgets/hashtag_widgets/hashtag_widget.dart';
import '../../../utils/constants/colors.dart';
import '../../domain/models/classes/opinion.dart';
import 'opinion_item_widgets/comments_count_widget.dart';
import 'opinion_item_widgets/opinion_title_widget.dart';
import 'opinion_item_widgets/share_button_widget.dart';
import 'opinion_item_widgets/views_count_widget.dart';
import 'opinion_item_widgets/votes_chart.dart';
import 'opinion_item_widgets/votes_count_widget.dart';

class OpinionPageItemWidget extends StatelessWidget {
  final Opinion opinion;
  final bool isVoted;
  final Function(int vote)? onVote;

  const OpinionPageItemWidget({
    Key? key,
    required this.opinion,
    this.onVote,
    this.isVoted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHashtagsAndTitle([
                "#تحياتي",
                "#اعز_الناس_امي",
                "#اعز_الناس_ابي",
                "#اعز_الناس_اخوي",
                "#اعز_الناس_اختي",
              ]),
              VotesChart(isVoted: isVoted, onVote: this.onVote),
              _buildViewsAndComments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHashtagsAndTitle(
    List<String> hashtags,
  ) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 5.0,
          spacing: 5.0,
          children: hashtags
              .map(
                (e) => HashtagWidget(
                  hashtag: e,
                  backgroundColor: primaryColorDark,
                  textColor: secondaryColorDark,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: OpinionTitleWidget(opinionTitle: opinion.title),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildViewsAndComments() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShareButtonWidget(),
        SizedBox(width: 20),
        VotesCountWidget(votesCount: 200),
        SizedBox(width: 20),
        CommentsCountWidget(commentsCount: 140),
        SizedBox(width: 20),
        ViewsCountWidget(viewsCount: 300),
      ],
    );
  }
}
