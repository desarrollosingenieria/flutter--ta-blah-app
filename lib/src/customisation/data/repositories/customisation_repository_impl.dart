import 'package:tablah/core/errors/failures.dart';
import 'package:tablah/src/customisation/data/data_sources/local/customisation_local_data_source.dart';
import 'package:tablah/src/customisation/domain/entities/app_parameters.dart';
import 'package:tablah/src/customisation/domain/repositories/customisation_repository.dart';
import 'package:dartz/dartz.dart';

class CustomisationRepositoryImpl implements CustomisationRepository {

  final CustomisationLocalDataSource customisationLocalDataSource = HiveCustomisationLocalDataSourceImpl();

  @override
  Future<Either<Failure, bool>> clearAppParameters() async {
    try {
      final bool result = await customisationLocalDataSource.clearAppParameters();
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to clear app parameters'));
    }
  }

  @override
  Future<Either<Failure, AppParameters>> getAppParameters() async {
    try {
      final AppParameters parameters = await customisationLocalDataSource.getAppParameters();
      return Right(parameters);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to get app parameters'));
    }
  }

  @override
  Future<Either<Failure, bool>> initAppParameters() async {
    try {
      final bool result = await customisationLocalDataSource.initAppParameters();
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to initialize app parameters'));
    }
  }

  @override
  Future<Either<Failure, bool>> setAppParameters(AppParameters parameters) async {
     try {
      final bool result = await customisationLocalDataSource.setAppParameters(parameters);
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to set app parameters'));
    }
  }

  @override
  bool get isAppParametersSet => customisationLocalDataSource.isAppParametersSet;

  @override
  AppParameters get appParameters => customisationLocalDataSource.appParameters;
}
