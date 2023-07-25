import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_information/presentation/cubits/remote_user_information_cubit.dart';

class UserStarsCountWidget extends StatelessWidget {
  const UserStarsCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10, end: 5),
      child:
          BlocBuilder<RemoteUserInformationCubit, RemoteUserInformationState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteUserInformationLoading:
              return const Center(child: CupertinoActivityIndicator());
            case RemoteUserInformationFailed:
              return const Center(child: Icon(Icons.refresh));
            case RemoteUserInformationSuccess:
              return GestureDetector(
                // onTap: () => appRouter.push(const SearchView()),
                child: Row(
                  children: [
                    Text(
                      "${state.user?.starsCount}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.black, size: 16),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
