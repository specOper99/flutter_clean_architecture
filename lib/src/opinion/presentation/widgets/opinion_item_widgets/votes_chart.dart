import 'package:d_chart/d_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/is_rtl_locale.dart';

class VotesChart extends StatelessWidget {
  const VotesChart(
      {Key? key, this.isVoted = false, this.onVote, this.articleUrl})
      : super(key: key);
  final String? articleUrl;
  final bool isVoted;
  final Function(int vote)? onVote;

  @override
  Widget build(BuildContext context) {
    final articleUrl = this.articleUrl;

    if (!isVoted)
      return Column(
        children: [
          if (articleUrl != null)
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse(articleUrl)).catchError((error) {
                  showToast(error.toString());
                  return false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svgs/not-sure.svg'),
                  const SizedBox(width: 5),
                  Text(AppLocalizations.of(context)!.not_sure_yet_read_more),
                ],
              ),
            ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildVoteButton(CupertinoIcons.hand_thumbsup, voteColorVeryAgree,
                  AppLocalizations.of(context)!.very_agree, context, 4),
              const SizedBox(width: 5),
              _buildVoteButton(CupertinoIcons.hand_thumbsup, voteColorAgree,
                  AppLocalizations.of(context)!.agree, context, 3),
              const SizedBox(width: 5),
              _buildVoteButton(CupertinoIcons.circle, voteColorNeutral,
                  AppLocalizations.of(context)!.neutral, context, 2),
              const SizedBox(width: 5),
              _buildVoteButton(
                  CupertinoIcons.hand_thumbsdown,
                  voteColorDisagree,
                  AppLocalizations.of(context)!.disagree,
                  context,
                  1),
              const SizedBox(width: 5),
              _buildVoteButton(
                  CupertinoIcons.hand_thumbsdown,
                  voteColorVeryDisagree,
                  AppLocalizations.of(context)!.very_disagree,
                  context,
                  0),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    return Column(
      children: [
        TextButton(
          onPressed: () => onVote?.call(-1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/not-sure.svg'),
              const SizedBox(width: 5),
              Text(AppLocalizations.of(context)!.changed_your_mind),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 200,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {
                      'domain': AppLocalizations.of(context)!.very_agree,
                      'measure': 30,
                    },
                    {
                      'domain': AppLocalizations.of(context)!.agree,
                      'measure': 20
                    },
                    {
                      'domain': AppLocalizations.of(context)!.neutral,
                      'measure': 15
                    },
                    {
                      'domain': AppLocalizations.of(context)!.disagree,
                      'measure': 16
                    },
                    {
                      'domain': AppLocalizations.of(context)!.very_disagree,
                      'measure': 19
                    },
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              measureLabelPaddingToAxisLine: 16,
              axisLineColor: Colors.transparent,
              barColor: (barData, index, id) {
                int myIndex = index ?? 0;
                if (isDirectionRTL(context)) {
                  myIndex = 4 - myIndex;
                }
                return voteColorsList[myIndex];
              },
              showBarValue: true,
              barValue: (barData, index) => "${barData['measure']}%",
              barValuePosition: BarValuePosition.inside,
              barValueAnchor: BarValueAnchor.middle,
              barValueColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget _buildVoteButton(
    IconData icon,
    Color color,
    String text,
    BuildContext context,
    int vote,
  ) {
    return GestureDetector(
      onTap: () {
        onVote?.call(vote);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.177,
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
