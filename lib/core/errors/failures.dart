abstract class Failure {

}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class LocalFailure extends Failure {
  final String message;

  LocalFailure({required this.message});
}