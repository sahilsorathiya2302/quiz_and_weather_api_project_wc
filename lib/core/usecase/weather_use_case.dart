import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract interface class WeatherUseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}

class WeatherParam {
  String city;
  WeatherParam({required this.city});
}

class NoParam {}
