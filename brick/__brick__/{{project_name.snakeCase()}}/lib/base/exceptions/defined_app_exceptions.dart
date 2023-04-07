import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/base/exceptions/app_exception.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

class UnknownException extends AppException {
  const UnknownException({
    super.message,
    super.source,
  });

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorUnknown;
}

class ConnectionErrorException extends AppException {
  const ConnectionErrorException(
    dynamic source,
  ) : super(message: 'No internet connection is available', source: source);

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorNoConnection;
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException(DioError source)
      : super(message: 'No internet connection is available', source: source);

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorConnectionTimeout;
}

class RequestCanceledException extends AppException {
  RequestCanceledException(RequestOptions requestOptions)
      : super(
          message:
              'Request (${requestOptions.method} -> ${requestOptions.path} was cancelled)', // ignore: lines_longer_than_80_chars
          source: requestOptions,
        );

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorConnectionCancelled;
}

class ServerMessageException extends AppException {
  const ServerMessageException({
    required String super.message,
    super.source,
  });

  @override
  String toMessage(BuildContext context) =>
      message ?? AppLocalizations.of(context).errorUnknown;
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(DioError source)
      : super(message: 'Unauthorized', source: source);

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorUnknown;
}

class SessionExpiredException extends AppException {
  const SessionExpiredException(DioError source)
      : super(message: 'SessionExpired', source: source);

  @override
  String toMessage(BuildContext context) =>
      AppLocalizations.of(context).errorConnectionCancelled;
}
