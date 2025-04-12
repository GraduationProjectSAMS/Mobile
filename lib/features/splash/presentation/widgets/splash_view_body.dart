import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        FractionallySizedBox(),
        // make grid paper
        GridPaper(),
        LongPressDraggable(
          feedback: Text("data"),
          child: Text("data"),
        ),
        ModalBarrier(),
        NavigationBar(destinations: []),

        /// to behave as row then coulam
        OverflowBar(),
        // to make the child overflow the parent
        OverflowBox(),
        // same as container but with decoration
        PhysicalModel(
          color: Colors.red,
        ),
        PhysicalShape(
          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder()),
          color: Colors.red,
        ),

        // RangeSlider(values: values, onChanged: onChanged)
        TabPageSelector(),
      ],
    );
  }
}
// make sum method to calculate the sum of two numbers
