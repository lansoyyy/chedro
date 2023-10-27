import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'John Doe',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Administrator',
                fontSize: 12,
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
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
              Container(
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
                        for (int i = 0; i < 5; i++)
                          ListTile(
                            leading: TextWidget(
                              text: 'John Doe',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: '09090104355',
                                        fontSize: 12,
                                      ),
                                      TextWidget(
                                        text: 'Phone Number',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
