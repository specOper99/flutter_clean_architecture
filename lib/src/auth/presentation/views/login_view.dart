import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/presentation/widgets/app_bar_widgets/logged_in_home_app_bar_widget.dart';
import '../../../common/presentation/widgets/app_bar_widgets/logged_out_home_app_bar_widget.dart';
import '../../../common/presentation/widgets/square_bottom_navigation_bar_widget.dart';
import '../../../config/router/app_router.dart';
import '../../../config/router/app_router.gr.dart';
import '../../../opinion/domain/models/classes/opinion.dart';
import '../../../opinion/presentation/cubits/remote_opinions_cubit.dart';
import '../../../opinion/presentation/widgets/opinion_grid_item_widget.dart';
import '../../../user_information/presentation/cubits/remote_user_information_cubit.dart';
import '../../../utils/extensions/scroll_controller_extensions.dart';

@RoutePage()
class HomePagesView extends HookWidget {
  const HomePagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = useState<int>(0);
    final remoteOpinionsCubit = BlocProvider.of<RemoteOpinionsCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteOpinionsCubit.getRandomOpinions();
      });

      return scrollController.dispose;
    }, const []);

    final loggedInUser = context.read<RemoteUserInformationCubit>().state.user;

    return Scaffold(
      appBar: loggedInUser != null
          ? LoggedInHomeAppBarWidget()
          : LoggedOutHomeAppBarWidget(context),
      bottomNavigationBar: _buildBottomNavigationBar(currentPage),
      body: _selectedPage(currentPage.value, scrollController),
    );
  }

  Widget _buildBottomNavigationBar(ValueNotifier<int> currentPage) {
    return SquareBottomNavBarWidget(
      selectedIndex: currentPage.value,
      onItemSelected: (index) {
        currentPage.value = index;
      },
      backgroundColor: Colors.white,
      containerPadding: EdgeInsets.zero,
      showElevation: false,
      items: [
        SquareBottomNavBarItemWidget(
          icon: const Icon(Icons.home),
          activeColor: Colors.white,
          activeBackgroundColor: Colors.black,
          inactiveColor: Colors.black,
          inactiveBackgroundColor: Colors.white,
        ),
        SquareBottomNavBarItemWidget(
          icon: const Icon(Icons.check_rounded),
          activeColor: Colors.white,
          activeBackgroundColor: Colors.black,
          inactiveColor: Colors.black,
          inactiveBackgroundColor: Colors.white,
        ),
        SquareBottomNavBarItemWidget(
          icon: const Icon(Icons.whatshot),
          activeColor: Colors.white,
          activeBackgroundColor: Colors.black,
          inactiveColor: Colors.black,
          inactiveBackgroundColor: Colors.white,
        ),
        SquareBottomNavBarItemWidget(
          icon: const Icon(Icons.person),
          activeColor: Colors.white,
          activeBackgroundColor: Colors.black,
          inactiveColor: Colors.black,
          inactiveBackgroundColor: Colors.white,
        ),
      ],
    );
  }

  Widget _buildOpinions(
    ScrollController scrollController,
    List<Opinion> opinions,
    bool noMoreData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => OpinionGridItemWidget(
              opinion: opinions[index],
              // TODO: Change this to the data from the server
              isVoted: index % 3 == 0,
              onOpinionPressed: (e) => appRouter.push(
                OpinionDetailsView(opinion: e),
              ),
            ),
            childCount: opinions.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }

  Widget _selectedPage(int index, ScrollController scrollController) {
    switch (index) {
      case 1:
        return const Text('Voted');
      case 2:
        return const Text('Hot and Trending');
      case 3:
        return const Text('Profile');
      case 0:
      default:
        return BlocBuilder<RemoteOpinionsCubit, RemoteOpinionsState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case RemoteOpinionsLoading:
                return const Center(child: CupertinoActivityIndicator());
              case RemoteOpinionsFailed:
                return const Center(child: Icon(Icons.refresh));
              case RemoteOpinionsSuccess:
                return _buildOpinions(
                  scrollController,
                  state.opinions,
                  state.noMoreData,
                );
              default:
                return const SizedBox();
            }
          },
        );
    }
  }
}
