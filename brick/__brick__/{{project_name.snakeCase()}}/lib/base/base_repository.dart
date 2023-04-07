import 'package:{{project_name.snakeCase()}}/base/exceptions/app_exception.dart';
import 'package:{{project_name.snakeCase()}}/base/exceptions/defined_app_exceptions.dart';
import 'package:{{project_name.snakeCase()}}/base/models/api_response_generic.dart';
import 'package:{{project_name.snakeCase()}}/inject/logger_manager.dart';

typedef Fetcher<T> = Future<T> Function();

abstract class BaseRepository {
  BaseRepository();

  Future<ApiResponse<T>> request<T>({required Fetcher<T> fetcher}) async {
    T fetchedData;
    try {
      fetchedData = await fetcher();
    } catch (exception, stacktrace) {
      final appException = AppExceptionFactory.create(exception);
      LoggerManager.instance.e(appException, exception, stacktrace);
      if (appException is SessionExpiredException ||
          appException is UnauthorizedException) {
        // TODO(phonex34): Handle session expired or unauthorized
      }
      return ApiResponse.error(appException);
    }
    return ApiResponse.success(fetchedData);
  }
}
