import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Wraps any [sliver] in a real `Skeletonizer` effect when [enabled]==true.
/// When off, it just returns the sliver unmodified.
class SliverSkeletonizer extends StatelessWidget {
  final bool enabled;
  final Widget sliver;

  final Duration? highlightDuration;
  final Color? highlightColor;

  const SliverSkeletonizer({
    super.key,
    required this.enabled,
    required this.sliver,
    this.highlightDuration,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return sliver;

    // We "flatten" the sliver into a non-scrollable CustomScrollView
    // so that Skeletonizer can walk its widget tree.
    return SliverToBoxAdapter(
      child: Skeletonizer(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [sliver],
        ),
      ),
    );
  }
}
