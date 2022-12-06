import 'package:flutter/material.dart';

class RedDivider extends StatelessWidget {
  const RedDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 20, indent: 20, endIndent: 20, color: Colors.redAccent);
  }
}
