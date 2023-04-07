class Event<T> {
  Event(this._data);

  final T _data;
  bool _hasBeenHandled = false;
  bool get hasBeenHandled => _hasBeenHandled;

  T? proceed() {
    if (_hasBeenHandled) {
      return null;
    }
    _hasBeenHandled = true;
    return _data;
  }

  T peekContent() => _data;

  bool isType<T2>() => _data is T2;

  @override
  String toString() {
    return 'Event{isHandled: $_hasBeenHandled, content: $_data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Event &&
          runtimeType == other.runtimeType &&
          _data == other._data &&
          _hasBeenHandled == other._hasBeenHandled;

  @override
  int get hashCode => _data.hashCode ^ _hasBeenHandled.hashCode;
}
