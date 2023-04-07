import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:{{project_name.snakeCase()}}/modules/counter/counter.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CounterController controller) {
        return const CounterView();
      },
      init: CounterController(),
    );
  }
}

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Center(
        child: Obx(
          () => Text(
            'Clicks: ${controller.count}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => controller.increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => controller.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
