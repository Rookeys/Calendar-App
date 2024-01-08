import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class DatePickerInput extends StatefulWidget {
  const DatePickerInput({
    super.key,
    required this.label,
    this.isFutureCalendar = false,
    required this.onSaved,
  });

  final String label;
  final bool isFutureCalendar;
  final FormFieldSetter onSaved;

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
          GestureDetector(
            child: AbsorbPointer(
              child: TextFormField(
                controller: TextEditingController.fromValue(TextEditingValue(
                    text:
                        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}")),
                onSaved: widget.onSaved,
                // onSaved: widget.onSaved,
                // validator: widget.validator,
                readOnly: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: CustomColor.skyBlue,
                    size: 28,
                  ),
                ),
              ),
            ),
            onTap: () async {
              final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate:
                      widget.isFutureCalendar ? DateTime.now() : DateTime(1900),
                  lastDate: widget.isFutureCalendar
                      ? DateTime.now().add(const Duration(days: 1 * 365))
                      : DateTime.now(),
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
          const SizedBox(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
