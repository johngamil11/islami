class Failures {
  String errorMessage;

  Failures({required this.errorMessage});
}

class serverError extends Failures {
  serverError({required super.errorMessage});
}

class NetworkError extends Failures {
  NetworkError({required super.errorMessage});
}