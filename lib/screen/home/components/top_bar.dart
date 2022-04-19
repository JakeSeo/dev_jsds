import 'package:dev_jsds/common/ui.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UI().generateWidth(100),
      height: 70,
      child: Container(child: Text("this is top bar")),
    );
  }
}
