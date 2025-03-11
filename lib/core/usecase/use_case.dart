import 'package:fpdart/fpdart.dart';

import '../failure/failure.dart';

/// Generic UseCase interface for all use cases
abstract interface class UseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

/// Use this class when no parameters are required
class NoParam {}

class QuizParam {
  int amount;
  String type;

  QuizParam({required this.amount, required this.type});
}

class WeatherParam {
  String city;
  WeatherParam({required this.city});
}
