import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CommonDialogPage extends StatelessWidget {
  const CommonDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      title: Text('common dialog'),
      children: <Widget>[],
    );
  }
}
