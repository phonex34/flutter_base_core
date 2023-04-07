import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:equatable/equatable.dart';

enum MessageType { info, error, warning, success }

class Message extends Equatable {
  const Message({required this.content, this.type = MessageType.info});

  final MessageType type;
  final String content;

  ContentType get snackBarType {
    switch (type) {
      case MessageType.info:
        return ContentType.help;
      case MessageType.error:
        return ContentType.failure;
      case MessageType.warning:
        return ContentType.warning;
      case MessageType.success:
        return ContentType.success;
    }
  }

  @override
  List<Object?> get props => [type, content];
}
