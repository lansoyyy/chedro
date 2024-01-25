import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:chedro/widgets/user_drawer_widget.dart';
import 'package:flutter/material.dart';

class UsersHomeScreen extends StatefulWidget {
  const UsersHomeScreen({super.key});

  @override
  State<UsersHomeScreen> createState() => _UsersHomeScreenState();
}

class _UsersHomeScreenState extends State<UsersHomeScreen> {
  final searchController = TextEditingController();
  String nameSearched = '';
  final dateController = TextEditingController();
  String dateSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            TextWidget(
              text: 'CHED RO X1 - Special Order',
              fontSize: 18,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 50,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Special Orders',
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: 'Active S.O',
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: 'Accepted S.O',
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: 'Disapproved S.O',
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Bold',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          nameSearched = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Search here...',
                          hintStyle: TextStyle(fontFamily: 'QRegular'),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                      controller: searchController,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          dateSearched = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Date Created',
                          hintStyle: TextStyle(fontFamily: 'QRegular'),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                      controller: dateController,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 150,
                    height: 45,
                    color: Colors.blue,
                    onPressed: () {},
                    child: Row(
                      children: [
                        TextWidget(
                          text: 'Reload Data',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ],
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
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                        child: Container(
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Special Order',
                                          fontSize: 14,
                                          fontFamily: 'Bold',
                                          color: Colors.white,
                                        ),
                                        TextWidget(
                                          text: '01-12-2023',
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextWidget(
                                          text: 'yesterday at 2pm',
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.file_copy_rounded,
                                      color: Colors.white,
                                      size: 75,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.group,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextWidget(
                                      text: '0',
                                      fontSize: 45,
                                      color: Colors.white,
                                      fontFamily: 'Bold',
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    height: 20,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ButtonWidget(
                                    radius: 100,
                                    width: 75,
                                    height: 30,
                                    fontSize: 12,
                                    label: 'View',
                                    onPressed: () {},
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
