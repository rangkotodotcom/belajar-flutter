import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = [
    "Brazil",
    "Italia (Disabled)",
    "Tunisia",
    "Canada",
    "India",
    "Indonesia"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: data,
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: print,
          selectedItem: "Brazil",
        ),
      )),
    );
  }
}
