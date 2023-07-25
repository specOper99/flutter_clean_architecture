import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/presentation/widgets/app_bar_widgets/logged_in_home_app_bar_widget.dart';
import '../../../common/presentation/widgets/app_bar_widgets/logged_out_home_app_bar_widget.dart';
import '../../../user_information/presentation/cubits/remote_user_information_cubit.dart';
import '../../../utils/constants/numbers.dart';
import '../../domain/models/classes/opinion.dart';
import '../cubits/remote_opinions_cubit.dart';
import '../widgets/opinion_page_item_widget.dart';

@RoutePage()
class RandomOpinionView extends HookWidget {
  const RandomOpinionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    final loggedInUser = context.read<RemoteUserInformationCubit>().state.user;

    return Scaffold(
      appBar: loggedInUser != null
          ? LoggedInHomeAppBarWidget()
          : LoggedOutHomeAppBarWidget(context),
      body: _buildOpinionsBlocBuilder(pageController, context),
    );
  }

  Widget _buildOpinions(
    PageController pageController,
    List<Opinion> opinions,
    bool noMoreData,
    BuildContext context,
  ) {
    final remoteOpinionsCubit = BlocProvider.of<RemoteOpinionsCubit>(context);

    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      onPageChanged: (page) {
        if ((page) + 3 > defaultPageSize * remoteOpinionsCubit.page)
          remoteOpinionsCubit.getRandomOpinions();
      },
      itemCount: opinions.length + 1,
      itemBuilder: (context, index) {
        if (!noMoreData && index == opinions.length)
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 30,
            ),
          );

        return OpinionPageItemWidget(
          opinion: opinions[index],
          isVoted: index % 3 == 0,
        );
      },
    );
  }

  Widget _buildOpinionsBlocBuilder(
      PageController pageController, BuildContext context) {
    return BlocBuilder<RemoteOpinionsCubit, RemoteOpinionsState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case RemoteOpinionsLoading:
            return const Center(child: CupertinoActivityIndicator());
          case RemoteOpinionsFailed:
            return const Center(child: Icon(Icons.refresh));
          case RemoteOpinionsSuccess:
            return _buildOpinions(
              pageController,
              state.opinions,
              state.noMoreData,
              context,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
