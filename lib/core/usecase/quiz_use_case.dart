import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract interface class QuizUseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

class QuizParam {
  int amount;
  String type;

  QuizParam({required this.amount, required this.type});
}

class NoParam {}
