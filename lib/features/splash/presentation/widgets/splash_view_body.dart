import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        const FractionallySizedBox(),
        // make grid paper
        const GridPaper(),
        const LongPressDraggable(
          feedback: Text('data'),
          child: Text('data'),
        ),
        const ModalBarrier(),
        NavigationBar(destinations: const []),

        /// to behave as row then coulam
        const OverflowBar(),
        // to make the child overflow the parent
        const OverflowBox(),
        // same as container but with decoration
        const PhysicalModel(
          color: Colors.red,
        ),
        const PhysicalShape(
          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder()),
          color: Colors.red,
        ),

        // RangeSlider(values: values, onChanged: onChanged)
        const TabPageSelector(),
      ],
    );
  }
}
// make sum method to calculate the sum of two numbers
