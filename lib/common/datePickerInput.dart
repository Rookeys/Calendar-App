import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class DatePickerInput extends StatefulWidget {
  const DatePickerInput({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<DatePickerInput> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DatePickerInput> {
  DateTime date = DateTime.now();
  final isOpen = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColor.darkGray,
            ),
          ),
          TextFormField(
            controller: TextEditingController.fromValue(TextEditingValue(
                text:
                    "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}")),
            // onSaved: widget.onSaved,
            // validator: widget.validator,
            readOnly: true,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                child: const Icon(
                  Icons.calendar_month_rounded,
                  color: CustomColor.skyBlue,
                  size: 28,
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      builder: (context, child) {
                        return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: CustomColor.skyBlue,
                                onPrimary: CustomColor.white,
                                onSurface: CustomColor.black,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      CustomColor.skyBlue, // button text color
                                ),
                              ),
                            ),
                            child: child!);
                      });
                  if (selectedDate != null) {
                    setState(() {
                      date = selectedDate;
                    });
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
