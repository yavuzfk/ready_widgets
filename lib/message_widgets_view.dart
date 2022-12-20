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
                Icons.upgrade_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text('Material Banner'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        child: const Text('Close'),
                      )
                    ],
                  ),
                );
              },
              label: const Text('Top Banner'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 11, 184, 89),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
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
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: const Text("dasfsdf"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unkno")
                              ],
                            ));
                      });
                },
                child: const Text("Bottom Sheet"))
          ],
        ),
      ),
    );
  }
}
