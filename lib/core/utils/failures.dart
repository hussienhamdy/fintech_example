abstract class Failure {}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}

class FailureWithMessage extends Failure {
  final String message;
  FailureWithMessage({required this.message});
}
