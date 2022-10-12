import 'package:flutter/material.dart';

abstract class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  bool _mounted = true;
  bool get mounted => _mounted;

  @override
  void dispose() {
    super.dispose();
    _mounted = false;
  }

  void setBusy(bool value) {
    _busy = value;
    if (mounted) {
      notifyListeners();
    }
  }

  void initialize();
}
