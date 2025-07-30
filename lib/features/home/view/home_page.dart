import 'package:crud_api/core/enums/src/async_status.dart';
import 'package:crud_api/features/home/bloc/home_bloc.dart';
import 'package:crud_api/features/home/widget/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: HomePage(key: key),
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<HomeBloc>().add(
      PostHomeEvent(),
    );
    _scrollController.addListener(() {
      if (_isBottom) {
        context.read<HomeBloc>().add(
          PostHomeEvent(),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('--CRUD--'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.result.status) {
            case AsyncStatus.initial:
            case AsyncStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case AsyncStatus.success:
              if (state.result.data!.isEmpty) {
                return const Center(child: Text('No Data!'));
              } else {
                return RefreshIndicator.adaptive(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(
                      PostHomeEvent(
                        refresh: true,
                      ),
                    );
                  },
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: state.hasReachedMax
                        ? state.result.data!.length
                        : state.result.data!.length + 1,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      if (index >= state.result.data!.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return PostItem(
                        post: state.result.data![index],
                        index: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                );
              }
            case AsyncStatus.failure:
              return Center(
                child: Text(
                  'Erorr : ${state.result.error}',
                  textAlign: TextAlign.center,
                ),
              );
          }
        },
      ),
    );
  }
}
