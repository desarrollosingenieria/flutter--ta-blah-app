import 'package:tablah/src/customisation/data/repositories/customisation_repository_impl.dart';
import 'package:tablah/src/customisation/domain/entities/app_parameters.dart';
import 'package:tablah/src/customisation/domain/repositories/customisation_repository.dart';

class CustomisationService {
  final CustomisationRepository repository = CustomisationRepositoryImpl();

  Future<void> initAppService() async {
    if (!repository.isAppParametersSet) {
      await repository.initAppParameters();
    }
  }

  Future<bool> setAppParameters(AppParameters parameters) async {
    final result = await repository.setAppParameters(parameters);

    return result.fold((l) => throw l, (r) => r);
  }

  Future<AppParameters> getAppParameters() async {
    final result = await repository.getAppParameters();

    return result.fold((l) => throw l, (r) => r);
  }

  Future<bool> clearAppParameters() async {
    final result = await repository.clearAppParameters();

    return result.fold((l) => throw l, (r) => r);
  }

  AppParameters get appParameters => repository.appParameters;
}
