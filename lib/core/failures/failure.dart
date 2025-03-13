class Failure {
  final String message;

  Failure({required this.message});
  @override
  String toString() => 'Failure(message:$message)';
}

class ServerConfig extends Failure {
  ServerConfig({required super.message});
}
