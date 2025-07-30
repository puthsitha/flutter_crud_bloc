part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.result = const AsyncResult(),
    this.hasReachedMax = false,
    this.page = 1,
  });

  final AsyncResult<List<PostModel>> result;
  final bool hasReachedMax;
  final int page;

  HomeState copyWith({
    AsyncResult<List<PostModel>>? result,
    bool? hasReachedMax,
    int? page,
  }) {
    return HomeState(
      result: result ?? this.result,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [result, hasReachedMax, page];
}
