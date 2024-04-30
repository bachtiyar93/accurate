import 'package:cpssoft/helper/api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  ApiService get yourDependency => ApiService();
}