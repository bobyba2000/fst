import 'package:flutter/material.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';

class AutoCompleteWidget<T> extends StatefulWidget {
  final Future<List<T>> Function(String) getSuggestData;
  final Widget Function(T)? suggestionBuilder;
  final dynamic Function(T)? onTapItem;
  final void Function(String)? onSubmitted;
  const AutoCompleteWidget({
    super.key,
    required this.getSuggestData,
    this.suggestionBuilder,
    this.onTapItem,
    this.onSubmitted,
  });

  @override
  State<AutoCompleteWidget<T>> createState() => _AutoCompleteWidgetState<T>();
}

class _AutoCompleteWidgetState<T> extends State<AutoCompleteWidget<T>> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AsyncAutocomplete<T>(
      controller: _controller,
      asyncSuggestions: widget.getSuggestData,
      onTapItem: (data) {
        _controller.text = data.toString();
        widget.onTapItem?.call(data);
      },
      onSubmitted: (value) {
        widget.onSubmitted?.call(value);
      },
      suggestionBuilder: widget.suggestionBuilder ??
          (T data) => ListTile(
                title: Text(
                  data.toString(),
                ),
              ),
    );
  }
}
