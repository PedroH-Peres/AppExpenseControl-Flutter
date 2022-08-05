import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardtype;
  final Function(String) onsubmit;
  final String? label;

  const AdaptativeTextField({Key? key, required this.controller, this.keyboardtype, required this.onsubmit, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoTextField(
      controller: controller,
      keyboardType: keyboardtype,
      onSubmitted: onsubmit,
      placeholder: label,
    )
    : TextField(
      controller: controller,
      keyboardType: keyboardtype,
      onSubmitted: onsubmit,
      decoration: InputDecoration(labelText: label),
      )  
    ;
  }
}