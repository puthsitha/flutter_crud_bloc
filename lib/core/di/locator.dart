import 'package:crud_api/core/constants/src/app_env.dart';
import 'package:get_it/get_it.dart';
import 'package:repository/repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpLocator() async {
  // * Base Api Client
  GetIt.I.registerSingleton<ApiClient>(
    ApiClient(
      baseUrl: AppEnv.baseUrl,
    ),
  );
}
