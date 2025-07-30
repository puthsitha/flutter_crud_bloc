part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class PostHomeEvent extends HomeEvent {
  PostHomeEvent({
    this.refresh = false,
    this.showLoadingOnRefresh = true,
  });
  final bool refresh;
  final bool showLoadingOnRefresh;
}
