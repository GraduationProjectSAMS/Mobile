import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';



class GideItemAnimation extends StatelessWidget {
  const GideItemAnimation({super.key, required this.child, required this.index, required this.columnCount});
final Widget child;
final int index;
final int columnCount;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 375),
      columnCount: columnCount,
      child: SlideAnimation(

        child: FadeInAnimation(
          child:child,
        ),),);
  }
}
class ListItemAnimation extends StatelessWidget {
  const ListItemAnimation({
    super.key,
    required this.child,
    required this.index,  this.isHorizontal = false,
  });

  final Widget child;
  final int index;
final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        horizontalOffset: isHorizontal?  50.0:null,
        verticalOffset: isHorizontal? null: 50.0,

        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}