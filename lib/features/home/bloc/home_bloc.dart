import 'package:bloc/bloc.dart';
import 'package:crud_api/core/enums/enums.dart';
import 'package:crud_api/core/event_transformers.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PostReporitory postReporitory})
    : _postReporitory = postReporitory,
      super(const HomeState()) {
    on<PostHomeEvent>(
      (event, emit) => _fetchListPost(
        event,
        emit,
        refresh: event.refresh,
        showLoadingOnRefresh: event.showLoadingOnRefresh,
      ),
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }
  final PostReporitory _postReporitory;

  Future<void> _fetchListPost(
    HomeEvent event,
    Emitter<HomeState> emit, {
    required bool refresh,
    bool showLoadingOnRefresh = true,
  }) async {
    const pageSize = 10;
    if (refresh) {
      // Reset pagination
      emit(
        state.copyWith(
          result: state.result.copyWith(
            status: showLoadingOnRefresh
                ? state.result.status
                : AsyncStatus.loading,
          ),
          hasReachedMax: false,
          page: 1,
        ),
      );
    }

    if (state.hasReachedMax) return;
    try {
      final postResponse = await _postReporitory.listPost(
        page: state.page,
      );

      emit(
        state.copyWith(
          page: state.page + 1,
          hasReachedMax: postResponse.length < pageSize,
          result: state.result.copyWith(
            status: AsyncStatus.success,
            data: state.page == 1
                ? postResponse
                : [...state.result.data!, ...postResponse],
          ),
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          result: AsyncResult(
            status: AsyncStatus.failure,
            error: CustomException(err.toString()),
          ),
        ),
      );
      rethrow;
    }
  }
}
