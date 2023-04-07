import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/base/exceptions/app_exception.dart';

enum BaseResponseStatus { loading, success, error }

class ApiResponse<T> extends Equatable {
  const ApiResponse({required this.status, this.data, this.exception});

  const ApiResponse.loading()
      : status = BaseResponseStatus.loading,
        exception = null,
        data = null;

  const ApiResponse.success(this.data)
      : status = BaseResponseStatus.success,
        exception = null;

  const ApiResponse.error(this.exception)
      : status = BaseResponseStatus.error,
        data = null;

  final BaseResponseStatus status;
  final T? data;
  final AppException? exception;

  ApiResponse<T> copyWith({
    BaseResponseStatus? status,
    T? data,
    AppException? exception,
  }) {
    return ApiResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      exception: exception ?? this.exception,
    );
  }

  @override
  String toString() {
    return 'Status : $status \n Exception : $exception \n Data : $data';
  }

  @override
  List<Object?> get props => [status, data, exception];

  TResult when<TResult extends Object?>({
    required TResult Function(AppException? exception) error,
    required TResult Function(T? data) success,
    required TResult Function() loading,
  }) {
    if (status == BaseResponseStatus.error) {
      return error(exception);
    } else if (status == BaseResponseStatus.success) {
      return success(data);
    } else {
      return loading();
    }
  }
}
