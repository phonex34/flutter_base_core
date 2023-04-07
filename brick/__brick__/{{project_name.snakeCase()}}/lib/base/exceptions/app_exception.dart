import 'dart:io';
import 'package:{{project_name.snakeCase()}}/base/exceptions/defined_app_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/alias.dart';

/// An app exception used by app to show user an error.
abstract class AppException extends Equatable implements Exception {
  const AppException({this.message, this.source, this.code});

  final String? message;
  final int? code;
  final dynamic source;

  /// This method is called when this [AppException] is either shown in app UI
  /// or any kind of modal that should be readable by user.
  String toMessage(BuildContext context);

  @override
  String toString() {
    return '$runtimeType -- {message: $message, source: $source, code: $code}';
  }

  @override
  List<Object?> get props => [message, code, source];
}

const _kErrorKey = 'error';

abstract class AppExceptionFactory {
  AppExceptionFactory._internal();

  static AppException create(dynamic source) {
    if (source is DioError) {
      return _mapDioError(source);
    }

    /// This line isn't always true, [SocketException] can be thrown
    /// in many cases, beside no connection, like requesting wrong host.
    /// www.googlet.com
    if (source is SocketException) {
      return ConnectionErrorException(source);
    }

    return _createUnknownError(source);
  }

  /// Mapping [Dio] errors which can be used by [ApiServices].
  ///
  /// [DioError] contains two states, when server responses with error code
  /// or when connection did not happen eg. Connection Timeout.
  ///
  /// When [DioErrorType.unknown] is type of [source] then error will be passed
  /// back to [create] with original error source.
  static AppException _mapDioError(DioError source) {
    switch (source.type) {
      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
        return ConnectionErrorException(source);
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ConnectionTimeoutException(source);
      case DioErrorType.badResponse:
        final response = source.response;
        final statusCode = source.response?.statusCode;
        switch (statusCode) {
          case 401:
            if (response != null) {
              String? parsedMessage;
              if (response.data is JSON) {
                parsedMessage = _parseServerResponseMessage(response);
              }
              if (response.data is String) {
                parsedMessage = response.data as String;
              }
              if (parsedMessage?.toLowerCase().contains('token expired') ??
                  false) {
                return SessionExpiredException(source);
              }
            }
            return UnauthorizedException(source);
        }

        if (response != null) {
          return _mapServerResponse(response, source);
        }

        break;
      case DioErrorType.cancel:
        return RequestCanceledException(source.requestOptions);
      case DioErrorType.unknown:
        final dynamic error = source.error;

        if (error != null) {
          return create(error);
        }

        break;
    }

    return _createUnknownError(source);
  }

  /// Entry point for mapping server error responses.
  /// Eg. if logout should happen when response code is 310 then it can
  /// be handled like that
  ///
  /// ```dart
  ///     switch(response.statusCode){
  ///       case 310:
  ///         return MyAppException();
  ///     }
  /// ```
  static AppException _mapServerResponse(
    Response<dynamic> response,
    DioError source,
  ) {
    final message = _parseServerResponseMessage(response);
    if (message != null) {
      return ServerMessageException(message: message, source: source);
    }
    return _createUnknownError(response);
  }

  static UnknownException _createUnknownError(dynamic source) {
    return UnknownException(
      message: 'Not handler error occurred',
      source: source,
    );
  }

  static String? _parseServerResponseMessage(Response<dynamic> response) {
    final dynamic data = response.data;
    if (data is JSON) {
      if (data.containsKey(_kErrorKey)) {
        final dynamic errorMessage = data[_kErrorKey];
        if (errorMessage is String && errorMessage.isNotEmpty) {
          return errorMessage;
        }
      }
    }

    return null;
  }
}
