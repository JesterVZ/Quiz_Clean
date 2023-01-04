// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../base/colors.dart';

class Dropdown extends StatefulWidget {
  List dropdownList;
  double? dropdownHeight;
  String? value;

  Dropdown(
      {Key? key,
      required this.dropdownList,
      this.dropdownHeight,
      required this.value})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _DropdownStae();
}

class _DropdownStae extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return CoolDropdown(
      dropdownHeight: widget.dropdownHeight ?? 200,
      resultBD: BoxDecoration(
          borderRadius: BorderRadius.circular(70), color: dropdownColor),
      dropdownBD: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: dropdownResultColor),
      selectedItemBD: BoxDecoration(
        color: dropdownColor,
        borderRadius: BorderRadius.circular(10),
      ),
      selectedItemTS: TextStyle(fontSize: 20, color: mainColor),
      dropdownWidth: MediaQuery.of(context).size.width - 100,
      resultTS: TextStyle(color: mainColor, fontSize: 20),
      resultWidth: MediaQuery.of(context).size.width,
      dropdownList: widget.dropdownList,
      defaultValue: widget.dropdownList[0],
      onChange: (value) {
        if (kDebugMode) {
          print(value);
          widget.value = value;
        }
      },
    );
  }
}
