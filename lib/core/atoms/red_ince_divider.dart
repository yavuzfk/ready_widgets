import 'package:flutter/material.dart';

class RedInceDivider extends StatelessWidget {
  const RedInceDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 2, indent: 10, endIndent: 10, color: Colors.redAccent);
  }
}
