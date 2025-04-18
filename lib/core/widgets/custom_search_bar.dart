import 'package:flutter/material.dart';

import '../utilities/resources/icon_broken.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback ?ontTapClose;
 final void Function(String)? onChanged;
  final double minHeight;
 final void Function(String)? onSubmitted;
  const CustomSearchBar({
    super.key,
    this.hintText = 'Search...',

    this.minHeight = 50, this.ontTapClose, this.onChanged, this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      hintText: hintText,
    keyboardType: TextInputType.name,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      trailing:  [
        IconButton( onPressed: ontTapClose, icon: Icon(Icons.close),),
      ],

      leading: Icon(IconBroken.Search),
      constraints: BoxConstraints(minHeight: minHeight),
      onTapOutside: (_) =>  FocusScope.of(context).unfocus(),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}