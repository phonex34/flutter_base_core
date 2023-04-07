import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:{{project_name.snakeCase()}}/base/exceptions/app_exception.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/event.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/message.dart';
import 'package:{{project_name.snakeCase()}}/inject/logger_manager.dart';

// abstract class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   ScreenState createState();
// }

// abstract class ScreenState<T extends Screen> extends State<T> {
//   ScreenState();
//   final LoggerManager logger = LoggerManager.instance;
//   Widget buildContent(BuildContext context);
//   @override
//   void initState() {
//     super.initState();
//     logger.i('initState is called');
//   }

//   @override
//   void dispose() {
//     logger.i('dispose is called');
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => KeyboardDismisser(
//         child: buildContent(context),
//       );

//   void handleMessage(Message message) => _showSnackBar(
//         text: message.content,
//         style: message.snackBarType,
//       );

//   void handleAppException(AppException exception) => _showSnackBar(
//         text: exception.toMessage(context),
//         style: ContentType.failure,
//       );

//   @protected
//   void handleEvent(Event<dynamic> event) {
//     if (!mounted) {
//       logger.i('Handle event was called but screen is not mounted: $event');
//       return;
//     }

//     if (event.hasBeenHandled) {
//       return;
//     }

//     if (event.peekContent() is AppException) {
//       final content = event.proceed() as AppException;
//       logger.i('Handling app exception event: $content');
//       handleAppException(content);
//       return;
//     }

//     if (event.isType<Message>()) {
//       final content = event.proceed() as Message;
//       logger.i('Handling message event: $content');
//       handleMessage(content);
//       return;
//     }

//     logger.i('Unhandled event found: ${event.peekContent()}');
//   }

//   void _showSnackBar({required String text, required ContentType style}) {
//     final snackBar = SnackBar(
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: Colors.transparent,
//       content: AwesomeSnackbarContent(
//         title: '',
//         message: text,
//         contentType: style,
//       ),
//     );

//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
// }

abstract class Screen extends StatelessWidget {
  Screen({super.key});

  final LoggerManager logger = LoggerManager.instance;
  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: buildContent(context),
      );
}
