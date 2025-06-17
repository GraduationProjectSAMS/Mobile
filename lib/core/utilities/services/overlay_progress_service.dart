import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

class OverlayProgressService {
  static OverlayEntry? _currentEntry;
  static _OverlayProgressWidgetState? _progressState;

  /// Show or update the progress overlay
  static void show(BuildContext context,
      {double progress = 0.0, String? message}) {
    if (_currentEntry == null) {
      final overlayWidget =
          _OverlayProgressWidget(progress: progress, message: message);
      _currentEntry = OverlayEntry(builder: (_) => overlayWidget);
      Overlay.of(context, rootOverlay: true).insert(_currentEntry!);
    } else {
      // Update progress if already showing
      _progressState?.update(progress, message: message);
    }
  }

  /// Hide the progress overlay
  static void hide() {
    _currentEntry?.remove();
    _currentEntry = null;
    _progressState = null;
  }
}

// Internal stateful widget to update progress dynamically
class _OverlayProgressWidget extends StatefulWidget {
  final double progress;
  final String? message;

  const _OverlayProgressWidget({required this.progress, this.message});

  @override
  _OverlayProgressWidgetState createState() => _OverlayProgressWidgetState();
}

class _OverlayProgressWidgetState extends State<_OverlayProgressWidget> {
  double _progress = 0.0;
  String? _message;

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
    _message = widget.message;
    OverlayProgressService._progressState = this;
  }

  void update(double progress, {String? message}) {
    setState(() {
      _progress = progress;
      if (message != null) _message = message;
    });
  }

  @override
  void dispose() {
    if (OverlayProgressService._progressState == this) {
      OverlayProgressService._progressState = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// (If you use ScreenUtil or similar for .sp, keep it; otherwise, replace 100.sp with 100.0)
    return Stack(
      children: [
        // Frosted glass dark background
        const Positioned.fill(
          child: ColoredBox(color: Colors.black54),
        ),
        Center(
          child: Material(
            color: Colors.transparent,
            elevation: 8,
            borderRadius: BorderRadius.circular(36),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 36),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(36),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.40),
                  width: 1.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Large green gradient progress ring
                  SizedBox(
                    width: 140.sp,
                    height: 140.sp,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: _progress),
                      // <-- provide _progress [0.0..1.0]
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            // Green gradient ring
                            CircularProgressIndicator(
                              value: value.clamp(0.0, 1.0),
                              constraints: BoxConstraints.tightFor(
                                  width: 100.sp, height: 100.sp),
                              strokeWidth: 14,
                              backgroundColor:
                                  Colors.white.withValues(alpha: 0.10),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
                            Container(
                              width: 94.sp,
                              height: 94.sp,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.20),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.greenAccent
                                        .withValues(alpha: 0.15),
                                    blurRadius: 14,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${(value * 100).toInt()}%',
                                style: AppStyles.textStyle20
                                    .copyWith(color: AppColors.primary),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  if (_message != null) ...[
                    const SizedBox(height: 26),
                    Text(
                      _message!,
                      style: AppStyles.textStyle20
                          .copyWith(color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
