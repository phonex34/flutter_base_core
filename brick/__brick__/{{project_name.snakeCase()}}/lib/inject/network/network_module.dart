// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/build_config.dart';
import 'package:{{project_name.snakeCase()}}/inject/network/dio_log_interceptor.dart';

const kAuthInterceptor = 'AuthorizationInterceptor';
const kBaseOptions = 'BaseOptions';
const kGithubBaseOptions = 'kGithubBaseOptions';
const kDio = 'kDio';
const kGithubDio = 'kGithubDio';

@module
abstract class NetworkModule {
  @Named(kBaseOptions)
  BaseOptions provideDioBaseOptions() => BaseOptions(
        baseUrl: BuildConfig.baseURL,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: <String, dynamic>{
          'accept': 'application/json',
        },
      );

  @Named(kGithubBaseOptions)
  BaseOptions provideGithubDioBaseOptions() => BaseOptions(
        baseUrl: 'https://api.github.com/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      );

  // @Named(kLoggingInterceptor)
  // Interceptor provideLoggingInterceptor() =>
  //     DioLogInterceptor(responseBody: false);

  // @Named(kAuthInterceptor)
  // Interceptor provideAuthorizationInterceptor(
  //   BuildConfig config,
  //   @Named(kUserIdentityStorage) Storage<UserIdentityDto> identityStorage,
  //   @Named(kUserLanguageStorage) Storage<LanguageConfig> languageStorage,
  // ) =>
  //     AuthorizationInterceptor(identityStorage, config, languageStorage);

  @Named(kDio)
  @lazySingleton
  Dio provideDio(
    @Named(kBaseOptions) BaseOptions baseOptions,
    @Named(kAuthInterceptor) Interceptor authInterceptor,
    @Injectable() DioLogInterceptor loggingInterceptor,
  ) =>
      Dio(baseOptions)
        ..interceptors.addAll([authInterceptor, loggingInterceptor]);

  @Named(kGithubDio)
  @lazySingleton
  Dio provideAppStoreDio(
    @Named(kGithubBaseOptions) BaseOptions baseOptions,
    @Injectable() DioLogInterceptor loggingInterceptor,
  ) =>
      Dio(baseOptions)..interceptors.addAll([loggingInterceptor]);
}
