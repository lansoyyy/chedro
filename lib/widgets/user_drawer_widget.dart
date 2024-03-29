import 'package:chedro/screens/auth/login_screen.dart';
import 'package:chedro/screens/tabs/letter_head_tab.dart';
import 'package:chedro/screens/users/users_home_screen.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class UserDrawerWidget extends StatefulWidget {
  const UserDrawerWidget({Key? key}) : super(key: key);

  @override
  State<UserDrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<UserDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: TextWidget(
                text: 'Special Orders',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UsersHomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_bulleted_rounded),
              title: TextWidget(
                text: 'Letterhead',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LetterheadTab()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_document),
              title: TextWidget(
                text: 'Signatories',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: TextWidget(
                text: 'Programs',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: TextWidget(
                text: 'Logout',
                fontSize: 12,
                color: Colors.black,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to Logout?',
                            style: TextStyle(fontFamily: 'QRegular'),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
