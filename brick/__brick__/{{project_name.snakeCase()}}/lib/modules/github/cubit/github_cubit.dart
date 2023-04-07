import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/base/base_view_model.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/message.dart';
import 'package:{{project_name.snakeCase()}}/base/models/api_response_generic.dart';
import 'package:{{project_name.snakeCase()}}/base/models/github_repo_model.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/cubit/github_repo.dart';

@injectable
class GithubCubit extends ViewModel<ApiResponse<List<GithubRepoModel>>> {
  GithubCubit(@injectable this._githubRepository)
      : super(const ApiResponse.loading());

  final GithubRepository _githubRepository;

  /// A description for yourCustomFunction
  Future<void> init() async {
    final data = await _githubRepository.getListRepo();
    data.when(
      success: (data) {
        addMessage(const Message(content: 'Success'));
        emit(ApiResponse.success(data));
      },
      error: (error) {
        if (error != null) {
          addException(error);
          emit(ApiResponse.error(error));
        }
      },
      loading: () {
        emit(const ApiResponse.loading());
      },
    );
  }
}
