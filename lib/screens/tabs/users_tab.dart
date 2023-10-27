import 'package:chedro/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'User Accounts',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    width: 20,
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
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(columns: [
                          DataColumn(
                            label: TextWidget(
                              text: 'Number',
                              fontSize: 13,
                              fontFamily: 'Bold',
                            ),
                          ),
                          DataColumn(
                            label: TextWidget(
                                text: 'Name', fontSize: 13, fontFamily: 'Bold'),
                          ),
                          DataColumn(
                            label: TextWidget(
                                text: 'Email',
                                fontSize: 13,
                                fontFamily: 'Bold'),
                          ),
                          DataColumn(
                            label: TextWidget(
                                text: 'Role', fontSize: 13, fontFamily: 'Bold'),
                          ),
                          DataColumn(
                            label: TextWidget(
                              text: '',
                              fontSize: 13,
                            ),
                          ),
                        ], rows: [
                          for (int i = 0; i < 50; i++)
                            DataRow(cells: [
                              DataCell(
                                TextWidget(
                                  text: i.toString(),
                                  fontSize: 11,
                                ),
                              ),
                              DataCell(
                                TextWidget(
                                  text: 'John Doe',
                                  fontSize: 11,
                                ),
                              ),
                              DataCell(
                                TextWidget(
                                  text: 'doe123565@gmail.com',
                                  fontSize: 11,
                                ),
                              ),
                              DataCell(
                                TextWidget(
                                  text: 'Administrator',
                                  fontSize: 11,
                                ),
                              ),
                              DataCell(IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  size: 25,
                                ),
                              )),
                            ])
                        ]),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
