import 'package:dev_jsds/screen/unknown_screen.dart';
import 'package:flutter/material.dart';

class UnknownPage extends Page {
  UnknownPage() : super(key: ValueKey('UnknownPage'));
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return UnknownScreen();
      },
    );
  }
}
