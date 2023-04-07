// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/github/cubit/github_repo.dart' as _i8;
import '../modules/github/cubit/github_cubit.dart' as _i9;
import 'logger_manager.dart' as _i6;
import 'network/dio_log_interceptor.dart' as _i5;
import 'network/network_module.dart' as _i10;
import 'router/app_router.dart' as _i3;
import 'snackbar_manager.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.factory<_i4.BaseOptions>(
    () => networkModule.provideDioBaseOptions(),
    instanceName: 'BaseOptions',
  );
  gh.factory<_i4.BaseOptions>(
    () => networkModule.provideGithubDioBaseOptions(),
    instanceName: 'kGithubBaseOptions',
  );
  gh.factory<_i5.DioLogInterceptor>(() => _i5.DioLogInterceptor());
  gh.lazySingleton<_i6.LoggerManager>(() => _i6.LoggerManager());
  gh.lazySingleton<_i7.SnackbarManager>(() => _i7.SnackbarManager());
  gh.lazySingleton<_i4.Dio>(
    () => networkModule.provideDio(
      gh<_i4.BaseOptions>(instanceName: 'BaseOptions'),
      gh<_i4.Interceptor>(instanceName: 'AuthorizationInterceptor'),
      gh<_i5.DioLogInterceptor>(),
    ),
    instanceName: 'kDio',
  );
  gh.lazySingleton<_i4.Dio>(
    () => networkModule.provideAppStoreDio(
      gh<_i4.BaseOptions>(instanceName: 'kGithubBaseOptions'),
      gh<_i5.DioLogInterceptor>(),
    ),
    instanceName: 'kGithubDio',
  );
  gh.factory<_i8.GithubRepository>(
      () => _i8.GithubRepositoryImpl(gh<_i4.Dio>(instanceName: 'kGithubDio')));
  gh.factory<_i9.GithubCubit>(
      () => _i9.GithubCubit(gh<_i8.GithubRepository>()));
  return getIt;
}

class _$NetworkModule extends _i10.NetworkModule {}
