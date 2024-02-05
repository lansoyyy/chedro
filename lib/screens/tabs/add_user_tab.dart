import 'package:chedro/services/add_user.dart';
import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/drawer_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:chedro/widgets/toast_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class AddUserTab extends StatefulWidget {
  const AddUserTab({super.key});

  @override
  State<AddUserTab> createState() => _AddUserTabState();
}

class _AddUserTabState extends State<AddUserTab> {
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
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        elevation: 0,
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 50,
        ),
        actions: [
          StreamBuilder<DocumentSnapshot>(
              stream: userData,
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                dynamic data = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: data['fname'] + ' ' + data['lname'],
                      fontSize: 14,
                      fontFamily: 'Bold',
                    ),
                    TextWidget(
                      text: data['role'],
                      fontSize: 12,
                    ),
                  ],
                );
              }),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'New User Details',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    controller: emailController,
                    label: 'Email',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    isObscure: true,
                    showEye: true,
                    controller: passwordController,
                    label: 'Password',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    controller: firstnameController,
                    label: 'First Name',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    controller: lastnameController,
                    label: 'Last Name',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Role',
                fontSize: 18,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  value: selected,
                  items: type1.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Center(
                        child: SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'QRegular',
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selected = newValue.toString();
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ButtonWidget(
                  label: 'Add User',
                  onPressed: () async {
                    try {
                      var userCredential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      addUser(
                        firstnameController.text,
                        lastnameController.text,
                        selected,
                        emailController.text,
                        userCredential.user?.uid ?? "",
                      );

                      showToast('User added succesfully!');
                      Navigator.pop(context);
                    } catch (e) {
                      showToast(e.toString());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
