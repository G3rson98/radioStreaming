import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final List<Object?> properties;
  
  const Failure({
    this.properties = const []
  }) ;

  @override
  List<Object?> get props => properties;

}

//General failures
class ServerFailure extends Failure{}

class SocketFailure extends Failure{}

class CacheFailure extends Failure{}