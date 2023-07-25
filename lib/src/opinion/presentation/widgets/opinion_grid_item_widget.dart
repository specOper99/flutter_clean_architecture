import 'package:flutter/material.dart';

// import 'package:intl/intl.dart' as INTL;

import '../../../utils/constants/colors.dart';
import '../../../vote/domain/models/classes/vote.dart';
import '../../domain/models/classes/opinion.dart';
import 'opinion_item_widgets/comments_count_widget.dart';
import 'opinion_item_widgets/grid_item_horizontal_bar_chart.dart';
import 'opinion_item_widgets/opinion_title_widget.dart';
import 'opinion_item_widgets/votes_count_widget.dart';

class OpinionGridItemWidget extends StatelessWidget {
  final Opinion opinion;
  final bool isVoted;
  final void Function(Opinion opinion)? onOpinionPressed;

  const OpinionGridItemWidget({
    Key? key,
    required this.opinion,
    this.onOpinionPressed,
    this.isVoted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.25,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF1E1E1E),
            ),
          ),
        ),
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            _buildTitle(),
            _buildVotesLineFigure(isVoted),
            _buildVotesAndComments(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    // final dateFormatter = new INTL.DateFormat('yyyy-MM-dd hh:mm a');
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child:
            OpinionTitleWidget(opinionTitle: opinion.title, isGridItem: true),
      ),
    );
  }

  Widget _buildVotesLineFigure(bool isVoted) {
    if (!isVoted) return Container();
    return Column(children: [
      Container(
        height: 7.5,
        child: GridItemHorizontalBarFigure(
          data: [
            Vote(units: 20, color: voteColorVeryDisagree),
            Vote(units: 20, color: voteColorDisagree),
            Vote(units: 20, color: voteColorNeutral),
            Vote(units: 20, color: voteColorAgree),
            Vote(units: 20, color: voteColorVeryAgree),
          ],
        ),
      ),
      const SizedBox(height: 20),
    ]);
  }

  Widget _buildVotesAndComments() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VotesCountWidget(votesCount: 1000),
        SizedBox(width: 20),
        CommentsCountWidget(
          commentsCount: 200,
        ),
      ],
    );
  }

  void _onTap() {
    if (onOpinionPressed != null) {
      onOpinionPressed?.call(opinion);
    }
  }
}
