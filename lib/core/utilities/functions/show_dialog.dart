import 'package:flutter/material.dart';

// Future<T?>  showDialog<T>(){
//  return showAdaptiveDialog(context: context, builder: (context) {
//     return AlertDialog.adaptive(
//       title: Text('Title'),
//       content: Text('This is a dialog'),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('OK'),
//         ),
//       ],
//     );
//   });
// }
Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
  Duration duration = const Duration(milliseconds: 300),
  bool dismissible = true,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,

    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) {
      return AlertDialog.adaptive(
        content: child,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}