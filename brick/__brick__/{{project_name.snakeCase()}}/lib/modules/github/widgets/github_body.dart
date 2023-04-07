import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/base/models/api_response_generic.dart';
import 'package:{{project_name.snakeCase()}}/base/models/github_repo_model.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/cubit/cubit.dart';

/// {@template github_body}
/// Body of the GithubPage.
///
/// Add what it does
/// {@endtemplate}
class GithubBody extends StatelessWidget {
  /// {@macro github_body}
  const GithubBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubCubit, ApiResponse<List<GithubRepoModel>>>(
      builder: (context, state) {
        if (state.status == BaseResponseStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text(state.toString()));
        }
      },
    );
  }
}
