import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.yMMMMEEEEd().format(selectDate),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: selectDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDatePickerMode: DatePickerMode.day,
                  selectableDayPredicate: (day) {
                    if ((day.isAfter(DateTime.now()
                            .subtract(const Duration(days: 7)))) &&
                        (day.isBefore(
                            DateTime.now().add(const Duration(days: 7))))) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  helpText: "help text",
                  cancelText: "cancel text",
                  confirmText: "confirm text",
                  fieldHintText: "field hint text",
                  fieldLabelText: "field label text",
                ).then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        selectDate = value;
                      });
                    }
                  },
                );
              },
              child: const Text(
                "Date Picker",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
