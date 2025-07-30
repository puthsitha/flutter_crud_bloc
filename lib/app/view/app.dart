import 'package:crud_api/core/di/locator.dart';
import 'package:crud_api/core/routes/src/app_router.dart';
import 'package:crud_api/features/home/bloc/home_bloc.dart';
import 'package:crud_api/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = AppRouter.router;
    final apiClient = getIt<ApiClient>();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostReporitory(apiClient: apiClient),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeBloc(postReporitory: context.read<PostReporitory>()),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: goRouter,
        ),
      ),
    );
  }
}
