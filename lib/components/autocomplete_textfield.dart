import 'package:calendar_app/models/company.dart';
import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatelessWidget {
  static final List<Company> _companyOptions = <Company>[
    Company(name: 'Company A', address: 'address A'),
    Company(name: 'Company B', address: 'address B'),
    Company(name: 'Company C', address: 'address C'),
  ];
  final TextEditingController textEditingController;
  final InputDecoration? decoration;
  final TextStyle? style;
  final Color? cursorColor;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutoCompleteTextField({
    super.key,
    required this.textEditingController,
    this.decoration,
    this.style,
    this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(validator: (value) {
      if (textEditingController.text.isEmpty) {
        return 'Please enter a company name';
      }
      return null;
    }, builder: (FormFieldState<String> state) {
      return RawAutocomplete<Company>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return _companyOptions.where((Company option) {
            return option
                .toString()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        displayStringForOption: _displayStringForOption,
        fieldViewBuilder: (
          BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted,
        ) {
          return TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
            style: style,
            cursorColor: cursorColor,
            decoration: decoration,
            validator: (value) =>
                value == null || value.isEmpty ? '회사 이름을 입력해주세요.' : null,
          );
        },
        optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<Company> onSelected,
            Iterable<Company> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Company option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                        textEditingController.text =
                            _displayStringForOption(option);
                      },
                      child: ListTile(
                        title: Text(_displayStringForOption(option)),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    });
  }

  static String _displayStringForOption(Company option) => option.name;
}
