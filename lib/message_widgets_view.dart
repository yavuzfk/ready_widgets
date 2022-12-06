import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ready_widgets/atoms/bottom_message.dart';
import 'package:ready_widgets/atoms/divider_with_text.dart';

class UserMessageWidgets extends StatefulWidget {
  const UserMessageWidgets({Key? key}) : super(key: key);

  @override
  _UserMessageWidgetsState createState() => _UserMessageWidgetsState();
}

class _UserMessageWidgetsState extends State<UserMessageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                bottomMessage(context, "Hello User");
              },
              label: const Text('Snackbar Message'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            const DividerWithText(text: "Products"),
            ElevatedButton(
                onPressed: () async {
                  await Flushbar(
                    // Need package (bkz. pubspec.yaml)
                    margin: const EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(8),
                    title: 'Kullanıcı Mesajı:',
                    message: 'Hi Samurai',
                    duration: const Duration(seconds: 3),
                    leftBarIndicatorColor: Colors.redAccent,
                  ).show(context);
                },
                child: const Text('Flush Bar with packet')),
          ],
        ),
      ),
    );
  }
}
