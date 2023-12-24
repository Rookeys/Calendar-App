import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator? validator;
  final Future<List<String>> Function({String name}) asyncItems;
  final Color themeColor;
  final InputDecoration? decoration;

  const SearchableDropdown({
    super.key,
    required this.themeColor,
    required this.asyncItems,
    this.decoration,
    this.onSaved,
    this.validator,
  });

  @override
  State<SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: widget.validator,
      onSaved: (newValue) => widget.onSaved!(newValue!),
      dropdownButtonProps: DropdownButtonProps(
        color: widget.themeColor,
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: widget.decoration?.copyWith(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
          baseStyle: TextStyle(color: widget.themeColor),
          textAlignVertical: TextAlignVertical.center),
      popupProps: PopupProps.dialog(
        dialogProps: const DialogProps(contentPadding: EdgeInsets.all(20)),
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: TextFieldProps(
          autofocus: true,
          cursorColor: widget.themeColor,
          style: TextStyle(color: widget.themeColor),
          decoration: (widget.decoration ?? const InputDecoration()).copyWith(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.themeColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.themeColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.themeColor,
              ),
            ),
          ),
        ),
        // disabledItemFn: (String s) => s.startsWith('I'),
      ),
      asyncItems: (String filter) => widget.asyncItems(name: filter),
      // dropdownDecoratorProps: DropDownDecoratorProps(

      // ),
      // onChanged: print,
    );
  }
}
