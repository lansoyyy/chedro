import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addSO(fname, lname, mname, extension, course, major, dateGrad, startDate,
    endDate, files) async {
  final docUser = FirebaseFirestore.instance.collection('SO').doc();

  final json = {
    'fname': fname,
    'lname': lname,
    'mname': mname,
    'extension': extension,
    'course': course,
    'major': major,
    'dateGrad': dateGrad,
    'startDate': startDate,
    'endDate': endDate,
    'files': files,
    'docId': docUser.id,
    'dateTime': DateTime.now(),
    'userId': FirebaseAuth.instance.currentUser!.uid,
    'day': DateTime.now().day,
    'month': DateTime.now().month,
    'year': DateTime.now().year,
    'status': 'Active'
  };

  await docUser.set(json);
}
