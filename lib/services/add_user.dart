import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(fname, lname, role, email, id) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(id);

  final json = {
    'fname': fname,
    'lname': lname,
    'role': role,
    'email': email,
    'id': id,
  };

  await docUser.set(json);
}
