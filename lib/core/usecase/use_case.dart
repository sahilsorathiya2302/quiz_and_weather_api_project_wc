import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract interface class UseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

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
