import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 50,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Administrator',
                fontSize: 14,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: '1',
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'No. of Schools',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: '1',
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Total Applicants',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: '1',
                              fontSize: 32,
                              fontFamily: 'Bold',
                              color: Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: 'Released S.O',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Schools S.O Applicants',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < 4; i++)
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: 'School #$i',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 500,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'S.O Status',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < 4; i++)
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: 'Type #$i',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'ACCOUNTS UPDATED',
                fontSize: 18,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('role', isEqualTo: 'Staff')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
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
                    return Container(
                        width: 700,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < data.docs.length; i++)
                                ListTile(
                                  leading: TextWidget(
                                    text:
                                        '${data.docs[i]['fname']} ${data.docs[i]['lname']}',
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                  ),
                                  title: TextWidget(
                                    text: 'Record Staff',
                                    fontSize: 12,
                                  ),
                                  trailing: SizedBox(
                                    width: 300,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: '${data.docs[i]['email']}',
                                              fontSize: 12,
                                            ),
                                            TextWidget(
                                              text: 'Email',
                                              fontSize: 10,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: 'School $i',
                                              fontSize: 12,
                                            ),
                                            TextWidget(
                                              text: 'School',
                                              fontSize: 10,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ButtonWidget(
                                          width: 75,
                                          height: 35,
                                          fontSize: 12,
                                          label: 'Details',
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: TextWidget(
                                                    text: 'Details',
                                                    fontSize: 18,
                                                    fontFamily: 'Bold',
                                                  ),
                                                  content: SizedBox(
                                                    width: 250,
                                                    height: 300,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextWidget(
                                                              text: 'Name',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'Regular'),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextWidget(
                                                              text:
                                                                  '${data.docs[i]['fname']} ${data.docs[i]['lname']}',
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Bold'),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextWidget(
                                                              text: 'Email',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'Regular'),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextWidget(
                                                              text: data.docs[i]
                                                                  ['email'],
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Bold'),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextWidget(
                                                              text: 'Role',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'Regular'),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextWidget(
                                                              text: data.docs[i]
                                                                  ['role'],
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Bold'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: TextWidget(
                                                        text: 'Close',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
