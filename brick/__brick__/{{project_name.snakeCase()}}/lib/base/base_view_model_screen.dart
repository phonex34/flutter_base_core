import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/base/base_screen.dart';
import 'package:{{project_name.snakeCase()}}/base/base_view_model.dart';

// abstract class ViewModelScreen extends Screen {
//   const ViewModelScreen({super.key});

//   @override
//   ViewModelScreenState createState();
// }
abstract class ViewModelScreen<VM extends ViewModel<dynamic>> extends Screen {
  ViewModelScreen({super.key}) : viewModel = ViewModel.create<VM>();

  late VM viewModel;

  Widget buildScreen(BuildContext context);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: buildScreen(context),
    );
  }
}
