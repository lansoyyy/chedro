import 'package:chedro/services/add_user.dart';
import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/drawer_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:chedro/widgets/toast_widget.dart';
import 'package:chedro/widgets/user_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:io';
import '../../widgets/text_widget.dart';

class LetterheadTab extends StatefulWidget {
  const LetterheadTab({super.key});

  @override
  State<LetterheadTab> createState() => _LetterheadTabState();
}

class _LetterheadTabState extends State<LetterheadTab> {
  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    try {
      if (result != null) {
        PlatformFile pickedFile = result.files.single;
        String fileName = pickedFile.name;
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = firebaseStorageRef.putData(pickedFile.bytes!);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        // Get the download URL of the uploaded file
        String downloadURL = await taskSnapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('Letterhead')
            .doc('1')
            .update({'img': await taskSnapshot.ref.getDownloadURL()});

        print("File uploaded to Firebase Storage. Download URL: $downloadURL");

        showToast('File uploaded!');
      } else {
        // Handle case where user canceled the picker
        print("User canceled the file picker");
      }
    } catch (e) {
      print("Error uploading file to Firebase Storage: $e");
    }
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  List<String> type1 = [
    'Administrator',
    'Staff',
  ];
  String selected = 'Administrator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          uploadPicture('gallery');
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        elevation: 0,
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 50,
        ),
      ),
      drawer: const UserDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Letterhead',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Current Letterhead',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Letterhead')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('error');
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    }

                    final data = snapshot.requireData;
                    return Center(
                      child: GestureDetector(
                        onTap: () async {
                          await launchUrlString(data.docs.first['img']);
                        },
                        child: Container(
                          width: 800,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: TextWidget(
                              text: 'View Image',
                              fontSize: 32,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
