import 'package:calendar_app/models/company.dart';
import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatelessWidget {
  static final List<Company> _companyOptions = <Company>[
    Company(name: 'Company A', address: 'address A'),
    Company(name: 'Company B', address: 'address B'),
    Company(name: 'Company C', address: 'address C'),
  ];
  final TextEditingController textEditingController;

  const AutoCompleteTextField(
      {super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
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
  }

  static String _displayStringForOption(Company option) => option.name;
}
