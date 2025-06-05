
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

class OverlayLoadingService {
  // Singleton instance
  static final OverlayLoadingService _instance = OverlayLoadingService._internal();

  // Factory constructor to return the singleton instance
  factory OverlayLoadingService() => _instance;

  // Private internal constructor
  OverlayLoadingService._internal();

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlay(BuildContext context) {
    const barrierColor = Colors.black54;
    final indicatorSize = 50.0.sp;
    const indicatorColor = Colors.white;
    const double strokeWidth = 4.0;

    return OverlayEntry(
      builder: (context) => Container(
        color: barrierColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient ring animation
                SizedBox(
                  height: indicatorSize,
                  width: indicatorSize,
                  child: const CircularProgressIndicator(
                    strokeWidth: strokeWidth,
                    valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
                  ),
                ),
                // Pulsing center dot
                AnimatedScale(
                  scale: 0.5,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: indicatorSize * 0.3,
                    height: indicatorSize * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: indicatorColor,
                      boxShadow: [
                        BoxShadow(
                          color: indicatorColor.withValues(alpha: 0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlay(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}