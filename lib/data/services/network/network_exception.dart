class NetworkException implements Exception {
  final String _message;
  final String _prefix;

  NetworkException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException({required String message}) : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException({required String message}) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException({required String message}) : super(message, "Unauthorised: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException({required String message}) : super(message, "Invalid Input: ");
}
