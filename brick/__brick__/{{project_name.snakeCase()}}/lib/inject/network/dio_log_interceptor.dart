import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@Injectable()
class DioLogInterceptor extends PrettyDioLogger {
  DioLogInterceptor()
      : super(logPrint: Logger(printer: SimplePrinter()).i, requestBody: true);

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final header = response.requestOptions.headers;
    if (header.containsKey('isLogDebug') && header['isLogDebug'] == true) {
      super.onResponse(response, handler);
    } else {
      super.logPrint(
        '╔╣ Response ║ Status: ${response.statusCode} ${response.statusMessage}', // ignore: lines_longer_than_80_chars
      );
      handler.next(response);
    }
  }
}
