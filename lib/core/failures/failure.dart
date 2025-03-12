class Failure {
  final String message;

  Failure({required this.message});
  @override
  String toString() => 'Failure(message:$message)';
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.message,
  });
}
