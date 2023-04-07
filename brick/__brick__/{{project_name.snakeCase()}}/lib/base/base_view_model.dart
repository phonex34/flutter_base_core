import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/base/exceptions/app_exception.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/event.dart';
import 'package:{{project_name.snakeCase()}}/base/utils/message.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.dart';
import 'package:{{project_name.snakeCase()}}/inject/logger_manager.dart';
import 'package:{{project_name.snakeCase()}}/inject/router/app_router.dart';
import 'package:{{project_name.snakeCase()}}/inject/snackbar_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ViewModel<T> extends BlocBase<T> {
  ViewModel(this._initState) : super(_initState);

  final T _initState;
  // final StreamController<Event<dynamic>> _eventsSC = StreamController();
  // Stream<Event<dynamic>> get eventsStream => _eventsSC.stream;
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  final LoggerManager _logger = LoggerManager.instance;
  final SnackbarManager _snackbarManager = SnackbarManager.instance;
  final AppRouter _router = AppRouter.instance;

  @protected
  void addViewModelEvent(dynamic content) {
    // if (_eventsSC.isClosed) {
    //   _logger.i('Tried adding event but stream was closed $content');
    //   return;
    // }
    _logger.i('Adding new event: $content');
    // _eventsSC.add(Event<dynamic>(content));
    handleEvent(Event<dynamic>(content));
  }

  @protected
  void addException(AppException error) => addViewModelEvent(error);

  @protected
  void addMessage(Message message) => addViewModelEvent(message);

  @mustCallSuper
  @override
  Future<void> close() async {
    _logger.i('dispose is called');
    // await _eventsSC.close();
    _isDisposed = true;
    await super.close();
  }

  static T create<T extends ViewModel>() {
    if (!getIt.isRegistered<T>()) {
      throw StateError(
        'ViewModel type of $T is not registered in getIt injectable',
      );
    }
    return getIt.get<T>();
  }

  void _handleMessage(Message message) => _showSnackBar(
        text: message.content,
        style: message.snackBarType,
      );

  void _handleAppException(AppException exception) {
    if (_router.navigatorKey.currentContext != null) {
      _showSnackBar(
        text: exception.toMessage(_router.navigatorKey.currentContext!),
        style: ContentType.failure,
      );
    }
  }

  @protected
  void handleEvent(Event<dynamic> event) {
    if (event.hasBeenHandled) {
      return;
    }

    if (event.peekContent() is AppException) {
      final content = event.proceed() as AppException;
      _logger.i('Handling app exception event: $content');
      _handleAppException(content);
      return;
    }

    if (event.isType<Message>()) {
      final content = event.proceed() as Message;
      _logger.i('Handling message event: $content');
      _handleMessage(content);
      return;
    }
    _logger.i('Unhandled event found: ${event.peekContent()}');
  }

  void _showSnackBar({required String text, required ContentType style}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: '',
        message: text,
        contentType: style,
      ),
    );

    _snackbarManager.scaffoldKey.currentState
      ?..hideCurrentMaterialBanner()
      ..showSnackBar(snackBar);
  }
}
