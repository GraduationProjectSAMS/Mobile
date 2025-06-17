import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenScaler with WidgetsBindingObserver {
  static final ScreenScaler _instance = ScreenScaler._internal();

  factory ScreenScaler() => _instance;

  ScreenScaler._internal();

  BuildContext? _context;
  MediaQueryData? _lastData;

  double _scaleFactor = 1.0;

  double get scale => _scaleFactor;

  void init(BuildContext context) {
    if (_context != null) return; // prevent double init
    _context = context;
    WidgetsBinding.instance.addObserver(this);

    final mq = MediaQuery.of(context);
    _lastData = mq;
    _scaleFactor = mq.size.width / 375.0; // 375 is base width
  }

  @override
  void didChangeMetrics() {
    if (_context == null) return;

    final newData = MediaQuery.of(_context!);
    if (_lastData?.size != newData.size) {
      _lastData = newData;
      _scaleFactor = newData.size.width / 375.0;

      _rebuildTree(_context! as Element);
    }
  }

  void _rebuildTree(Element root) {
    root.markNeedsBuild();
    root.visitChildren(_rebuildTree);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _context = null;
  }
}
