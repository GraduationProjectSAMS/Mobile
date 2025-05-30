import 'package:flutter/material.dart';

import '../utilities/resources/icon_broken.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final VoidCallback ?ontTapClose;
  final String? initialValue;
 final void Function(String)? onChanged;
  final double minHeight;
 final void Function(String)? onSubmitted;
  const CustomSearchBar({
    super.key,
    this.hintText = 'Search...',

    this.minHeight = 50, this.ontTapClose, this.onChanged, this.onSubmitted, this.initialValue,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }
  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      backgroundColor: WidgetStateProperty.all(Colors.white),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      hintText: widget.hintText,
    keyboardType: TextInputType.name,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      trailing:  [
        IconButton( onPressed:(){
          _controller.clear();
          if (widget.onChanged != null) {
            widget.onChanged!('');
            widget.ontTapClose?.call();
          }
        } , icon: const Icon(Icons.close),),
      ],

      leading: const Icon(IconBroken.Search),
      constraints: BoxConstraints(minHeight: widget.minHeight),
      onTapOutside: (_) =>  FocusScope.of(context).unfocus(),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}