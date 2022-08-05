import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdaptativeButton extends StatelessWidget {
  
  final String? label;
  final Function()? onPressed;
  
  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoButton(
      color: Theme.of(context).primaryColor,
      child: Text(label!, style: TextStyle(color: Colors.white),), 
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 20),
      )
    : ElevatedButton(
      onPressed: onPressed, 
      child: Text(label!,  style: TextStyle(color: Colors.white),)
      )  
    ;
  }
}