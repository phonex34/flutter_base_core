import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/base/base_repository.dart';
import 'package:{{project_name.snakeCase()}}/inject/network/network_module.dart';
import 'package:{{project_name.snakeCase()}}/base/models/api_response_generic.dart';
import 'package:{{project_name.snakeCase()}}/base/models/github_repo_model.dart';

abstract class GithubRepository extends BaseRepository {
  Future<ApiResponse<List<GithubRepoModel>>> getListRepo();
}

@Injectable(as: GithubRepository)
class GithubRepositoryImpl extends GithubRepository {
  GithubRepositoryImpl(@Named(kGithubDio) this._dio);

  final Dio _dio;

  @override
  Future<ApiResponse<List<GithubRepoModel>>> getListRepo() async {
    final data = await request(
      fetcher: () async {
        // final value = await _dio.get<List<dynamic>>(
        //   'repositories',
        //   options: Options(
        //     headers: {'isLogDebug': false},
        //   ),
        // );
        // if (value.data != null) {
        //   return GithubRepoModel.getList(value.data!);
        // }
        // return <GithubRepoModel>[];
        await Future.delayed(const Duration(seconds: 1));
        throw DioError(
          requestOptions: RequestOptions(path: 'repositories'),
          response: Response(
            requestOptions: RequestOptions(path: 'repositories'),
            statusCode: 500,
            statusMessage: 'Internal Server Error',
          ),
          type: DioErrorType.connectionTimeout,
        );
      },
    );
    return data;
  }
}
