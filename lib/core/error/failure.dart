// ignore_for_file: overridden_fields

abstract class Failure {
  final String? msg;
  final Object? data;

  Failure({this.msg, this.data});
}

// code => 500
class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure({super.msg, super.data});
}

// code => 400
class BadRequestFailure extends Failure {
  BadRequestFailure({super.msg, super.data});
}

// code => 401
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({super.msg, super.data});
}

// code => 404
class NotFoundFailure extends Failure {
  NotFoundFailure({super.msg, super.data});
}

// code 405
class MethodNotAllowedFailure extends Failure {
  MethodNotAllowedFailure({super.msg, super.data});
}

// code 408
class ConnectionTimeoutFailure extends Failure {
  ConnectionTimeoutFailure({super.msg,super.data});
}

// socketFailure
class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({super.msg,super.data});
}

// HttpFailure
class HttpFailure extends Failure {
  HttpFailure({super.msg,super.data});
}

// RequestCanceled
class RequestCanceledFailure extends Failure {
  RequestCanceledFailure({super.msg,super.data});
}

// UnknownFailure
class UnknownFailure extends Failure {
  UnknownFailure({super.msg,super.data});
}

// Need to logout user
class LogoutFailure extends Failure {
  LogoutFailure({super.msg,super.data});
}

class CustomFailure extends Failure {
  @override
  final dynamic data;

  CustomFailure({this.data}) : super(msg: data.toString());
}
