part of 'remote_opinions_cubit.dart';

abstract class RemoteOpinionsState extends Equatable {
  final List<Opinion> opinions;
  final bool noMoreData;
  final DioException? error;

  const RemoteOpinionsState({
    this.opinions = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [opinions, noMoreData, error];
}

class RemoteOpinionsLoading extends RemoteOpinionsState {
  const RemoteOpinionsLoading();
}

class RemoteOpinionsSuccess extends RemoteOpinionsState {
  const RemoteOpinionsSuccess({super.opinions, super.noMoreData});
}

class RemoteOpinionsFailed extends RemoteOpinionsState {
  const RemoteOpinionsFailed({super.error});
}
