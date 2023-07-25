import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/models/classes/opinion.dart';
import '../cubits/remote_opinions_cubit.dart';
import '../widgets/opinion_page_item_widget.dart';

@RoutePage()
class OpinionDetailsView extends HookWidget {
  const OpinionDetailsView({Key? key, required this.opinion}) : super(key: key);
  final Opinion opinion;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final isVoted = useState<bool>(false);
    final currentPage = useState<int>(0);

    useEffect(() {
      // TODO: Need to check if this code works
      // pageController.onScrollEndsListener(() {
      //   remoteOpinionsCubit.getBreakingNewsOpinions();
      // });

      return () {
        if (pageController.hasClients) pageController.dispose();
      };
    }, const []);

    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<RemoteOpinionsCubit, RemoteOpinionsState>(
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
                isVoted,
                state.noMoreData,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SvgPicture.asset(
          'assets/svgs/qarar-black.svg',
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
      // actions: [
      //   GestureDetector(
      //     // onTap: () => appRouter.push(const SearchView()),
      //     child: Padding(
      //       padding: const EdgeInsets.only(bottom: 10, left: 5),
      //       child: Row(
      //         children: [
      //           Text(
      //             14.toString(),
      //             style: const TextStyle(
      //               color: Colors.black,
      //               fontSize: 16,
      //             ),
      //           ),
      //           const SizedBox(width: 4),
      //           const Icon(Icons.star, color: Colors.black, size: 16),
      //         ],
      //       ),
      //     ),
      //   ),
      // ],
      // leading: GestureDetector(
      //   onTap: () => appRouter.push(const SavedArticlesView()),
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 14),
      //     child: CircleAvatar(
      //       backgroundColor: Colors.black,
      //       child: Icon(
      //         Icons.person,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildOpinions(
    ScrollController scrollController,
    List<Opinion> opinions,
    ValueNotifier<bool> isVoted,
    bool noMoreData,
  ) {
    // return PageView(
    //   controller: scrollController,
    //   slivers: [
    //     SliverGrid(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         // childAspectRatio: 1,
    //       ),
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) => OpinionPageItemWidget(
    //           opinion: opinions[index],
    //           isVoted: index % 3 == 0,
    //         ),
    //         childCount: opinions.length,
    //       ),
    //     ),
    //     if (!noMoreData)
    //       const SliverToBoxAdapter(
    //         child: Padding(
    //           padding: EdgeInsets.only(top: 14, bottom: 32),
    //           child: CupertinoActivityIndicator(),
    //         ),
    //       )
    //   ],
    // );
    return OpinionPageItemWidget(
      opinion: opinion,
      isVoted: isVoted.value,
      onVote: (value) {
        isVoted.value = !isVoted.value;
      },
    );
  }
}
