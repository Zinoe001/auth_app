import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ViewState { busy, idle, error}

class BaseViewModel extends ChangeNotifier {
  bool _disposed = false;
  bool get isDisposed => _disposed;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  bool get isBusy => _state == ViewState.busy;
  bool get isError => _state == ViewState.error;
  bool get isIdle => _state == ViewState.idle;

  ViewState _secondaryState = ViewState.idle;
  ViewState get secondaryState => _secondaryState;
  bool get isSecondaryBusy => _secondaryState == ViewState.busy;
  bool get isSecondaryError => _state == ViewState.error;
  bool get isSecondaryIdle => _state == ViewState.idle;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  changeState(ViewState currentState) {
    _state = currentState;
    if (!_disposed) notifyListeners();
  }

  setSecondaryBusy(ViewState currentState) {
    _secondaryState = currentState;
    if (!_disposed) notifyListeners();
  }
}
