import 'failures.dart';

class ErrorMessages{
  static const String noInternetMessageError    = 'No tiene conexión a internet,intentelo de nuevo más tarde';

  static const String authorizationMessageError = 'No tiene autorización, por favor inicie sesión';

  static const String serverFailureMessageError  = 'Ha ocurrido un error, intentelo de nuevo';

  static const String genericAuthMessageError   = 'Usuario o contraseña invalida';

  static const String cantLaunchUrlMessage   = 'No se puede abrir el enlace';


  static String mapFailureToMessage(Failure failure) {
    switch(failure.runtimeType){
      case ServerFailure:
        return serverFailureMessageError;
      case SocketFailure:
        return noInternetMessageError;
      default:
        return serverFailureMessageError;
    }
  }
}

