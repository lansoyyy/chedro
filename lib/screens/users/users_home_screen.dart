import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:chedro/widgets/toast_widget.dart';
import 'package:chedro/widgets/user_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String course = 'O+'; // Variable to store the selected blood type

  // List of blood types
  List<String> courses = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'N/A',
  ];

  String major = 'O+'; // Variable to store the selected blood type

  // List of blood types
  List<String> majors = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'N/A',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addSODialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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

  void dateFromPicker(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        controller.text = formattedDate;
      });
    } else {
      return null;
    }
  }

  final fname = TextEditingController();

  final lname = TextEditingController();
  final mname = TextEditingController();
  final extension = TextEditingController();
  final grad = TextEditingController();
  final start = TextEditingController();
  final end = TextEditingController();

  addSODialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Please submit all fields',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(controller: fname, label: 'First Name'),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(controller: lname, label: 'Last Name'),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(controller: mname, label: 'Middle Name'),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  controller: extension,
                  label: 'Extension (II, IV, Jr., Sr., etc)'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Course:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    onChanged: (newValue) {
                      setState(() {
                        course = newValue.toString();
                      });
                    },
                    underline: const SizedBox(),
                    value: course,
                    items: courses.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: SizedBox(
                            width: 250,
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
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Major:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    onChanged: (newValue) {
                      setState(() {
                        major = newValue.toString();
                      });
                    },
                    underline: const SizedBox(),
                    value: major,
                    items: majors.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: SizedBox(
                            width: 250,
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
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Close',
                fontSize: 12,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showDates();
              },
              child: TextWidget(
                text: 'Continue',
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }

  showDates() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Please submit all fields',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Date of Graduation',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        dateFromPicker(context, grad);
                      },
                      child: SizedBox(
                        width: 325,
                        height: 50,
                        child: TextFormField(
                          enabled: false,
                          style: const TextStyle(
                            fontFamily: 'Regular',
                            fontSize: 14,
                            color: Colors.black,
                          ),

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            hintText: grad.text,
                            border: InputBorder.none,
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: const TextStyle(
                                fontFamily: 'Bold', fontSize: 12),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          controller: grad,
                          // Pass the validator to the TextFormField
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Date Started',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        dateFromPicker(context, start);
                      },
                      child: SizedBox(
                        width: 325,
                        height: 50,
                        child: TextFormField(
                          enabled: false,
                          style: const TextStyle(
                            fontFamily: 'Regular',
                            fontSize: 14,
                            color: Colors.black,
                          ),

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            hintText: start.text,
                            border: InputBorder.none,
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: const TextStyle(
                                fontFamily: 'Bold', fontSize: 12),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          controller: start,
                          // Pass the validator to the TextFormField
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'End Started',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        dateFromPicker(context, end);
                      },
                      child: SizedBox(
                        width: 325,
                        height: 50,
                        child: TextFormField(
                          enabled: false,
                          style: const TextStyle(
                            fontFamily: 'Regular',
                            fontSize: 14,
                            color: Colors.black,
                          ),

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            hintText: end.text,
                            border: InputBorder.none,
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorStyle: const TextStyle(
                                fontFamily: 'Bold', fontSize: 12),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),

                          controller: end,
                          // Pass the validator to the TextFormField
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Close',
                fontSize: 12,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showAttachments();
              },
              child: TextWidget(
                text: 'Continue',
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }

  showAttachments() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'Please submit all fields',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: SizedBox(
            width: 750,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Form 137 - (not necessary)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text('Accomplished Evaluation Sheet'),
                const Text('CHED Approved Curriculum'),
                const Text('For Program Specific:'),
                const Text(
                    '6. Summary of Related Learning Experiences (RLE) /'),
                const Text(
                    '   Cases Attended (for Nursing/Midwifery Programs only)'),
                const Text(
                    '   Certificate of Completion (for programs with On-the-Job-Training (OJT)) with specified number of OJT hours completed and description of work;'),
                const Text(
                    '8. Training Record Book / On-Board Training (OBT)/ Certificate (for Maritime Programs only)'),
                const Text('For Graduate Program:'),
                const Text(
                    '9. Certificate of Comprehensive Exam Passed (Master\'s and Doctorate programs);'),
                const Text(
                    '10. Certificate of Oral Revalida Taken (Non-Thesis or Capstone Project)'),
                const Text(
                    '11. Digitized Copy of Thesis/Dissertation (for Graduate and Post-Graduate Programs)'),
                const Text('Others'),
                const Text(
                    '12. For Transferee students only, Original Copy of Transcript of Records - this is part of the admission requirements'),
                const Text(
                    '12. Original Certificate of Live Birth issued by PSA - (not necessary)'),
                const Text(
                    '8. Marriage Contract, if married (PSA Original copy)'),
                const Text(
                    '9. For Foreign Students only, Notice of Acceptance / Admission (NOA) and Certificate of Eligibility of Admission (CEA)'),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: Icon(
                          Icons.file_copy,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: ButtonWidget(
                    label: 'Upload File',
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Close',
                fontSize: 12,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showToast('SO submitted succesfully!');
              },
              child: TextWidget(
                text: 'Continue',
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    );
  }
}
