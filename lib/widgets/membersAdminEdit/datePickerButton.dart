import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key});

  @override
  State<DatePickerButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DatePickerButton> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final selectedDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            // initialEntryMode: DatePickerEntryMode.calendarOnly,
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
      child: Text(
        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      ),
    );
  }
}
