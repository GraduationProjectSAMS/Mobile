import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

// Custom route that looks like an overlay but acts like a page
class LoadingOverlayRoute extends PageRoute {
  final double indicatorSize;
  final Color indicatorColor;
  @override
  final Color barrierColor;

  LoadingOverlayRoute({
    required this.indicatorSize ,
    required this.indicatorColor ,
    required this.barrierColor
  });

  @override
  bool get opaque => false; // Makes background visible

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return PopScope(
      canPop: false, // Prevents back button dismissal
      child: FadeTransition(
        opacity: animation,
        child: Container(
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
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
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
      ),
    );
  }
}

class OverlayLoadingService {
  // Singleton instance
  static final OverlayLoadingService _instance =
      OverlayLoadingService._internal();

  // Factory constructor to return the singleton instance
  factory OverlayLoadingService() => _instance;

  // Private internal constructor
  OverlayLoadingService._internal();

  bool _isVisible = false;

  // Getter to check if overlay is visible
  bool get isVisible => _isVisible;

  void showOverlay(
    BuildContext context, {
    double? indicatorSize,
    Color? indicatorColor,
    Color? barrierColor,
  }) {
    if (_isVisible) return;

    _isVisible = true;

    Navigator.of(context).push(
      LoadingOverlayRoute(
        indicatorSize: indicatorSize ?? 50.0.sp,
        indicatorColor: indicatorColor ?? Colors.white,
        barrierColor: barrierColor ?? Colors.black45,
      ),
    );
  }

  void hideOverlay(BuildContext context) {
    if (!_isVisible) return;
    _isVisible = false;
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

  }
}
