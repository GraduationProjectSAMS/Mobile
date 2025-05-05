import 'package:flutter/cupertino.dart';

typedef LazyWidgetBuilder = Widget Function();

Widget buildListOrEmptyItem<T>({
  required List<T> list,
  required bool isLoading,
  required LazyWidgetBuilder listEmptyWidget,
  required Widget Function(List<T> list, bool isLoading) listWidget,
}) {
  if (isLoading) {
    return listWidget(list, isLoading); // Optional: pass empty list or actual
  } else {
    if (list.isEmpty) {
      return listEmptyWidget();
    } else {
      return listWidget(list, isLoading);
    }
  }
}
