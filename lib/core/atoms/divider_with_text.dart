import 'package:flutter/material.dart';
import 'package:ready_widgets/core/atoms/red_ince_divider.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(child: RedInceDivider()),
      Text(text),
      const Expanded(child: RedInceDivider()),
    ]);
  }
}
