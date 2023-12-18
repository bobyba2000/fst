import 'package:get_it/get_it.dart';

import '../../bloc/bloc_dependencies.dart';
import '../../model/data/dependencies.dart';
import '../../service/service_dependencies.dart';
import '../service/rest_utils.dart';

class AppDependencies {
  static GetIt injector = GetIt.instance;

  AppDependencies._();

  static void init() {
    injector.registerFactory(
      () => RestUtils(
        'http://api.weatherapi.com/v1/',
      ),
    );
    DataModelDependencies.init();
    ServiceDependencies.init();
    BlocDependencies.init();
  }
}
