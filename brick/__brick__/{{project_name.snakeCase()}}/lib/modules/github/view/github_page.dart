import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/base/base_view_model.dart';
import 'package:{{project_name.snakeCase()}}/base/base_view_model_screen.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/cubit/cubit.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/cubit/github_repo.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/widgets/github_body.dart';

/// {@template github_page}
/// A description for GithubPage
/// {@endtemplate}

@RoutePage()
class GithubPage extends ViewModelScreen<GithubCubit> {
  GithubPage({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..init(),
      child: const Scaffold(
        body: GithubView(),
      ),
    );
  }
}
// class GithubPage extends ViewModelScreen {
//   /// {@macro github_page}
//   const GithubPage({super.key});

//   /// The static route for GithubPage
//   static Route<dynamic> route() {
//     return MaterialPageRoute<dynamic>(builder: (_) => const GithubPage());
//   }

//   @override
//   ViewModelScreenState createState() => _GithubPageState();
// }

// class _GithubPageState extends ViewModelScreenState<GithubPage, GithubCubit> {
//   _GithubPageState();

//   @override
//   void initState() {
//     super.initState();
//     viewModel.init();
//   }

//   @override
//   Widget buildScreen(BuildContext context) {
//     return BlocProvider(
//       create: (context) => viewModel,
//       child: const Scaffold(
//         body: GithubView(),
//       ),
//     );
//   }
// }

class GithubView extends StatelessWidget {
  const GithubView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GithubBody();
  }
}
