import 'package:chedro/services/add_so.dart';
import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:chedro/widgets/toast_widget.dart';
import 'package:chedro/widgets/user_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  String course =
      'Associate in Computer Technology'; // Variable to store the selected blood type

  // List of blood types
  List<String> courses = [
    "Associate in Computer Technology",
    "Associate in Health Science Education",
    "Bachelor in Culture and Arts Studies",
    "Bachelor in Human Services",
    "Bachelor of Agricultural Technology",
    "Bachelor of Arts in Anthropology",
    "Bachelor of Arts in Christian Education",
    "Bachelor of Arts in Classical/Philosophy",
    "Bachelor of Arts in Communication",
    "Bachelor of Arts in Developmental Studies",
    "Bachelor of Arts in Economics",
    "Bachelor of Arts in English Language",
    "Bachelor of Arts in Filipino",
    "Bachelor of Arts in Foreign Service",
    "Bachelor of Arts in General Science",
    "Bachelor of Arts in History",
    "Bachelor of Arts In Interdisciplinary Studies",
    "Bachelor of Arts in International Studies",
    "Bachelor of Arts in Islamic Studies",
    "Bachelor of Arts in Library Science",
    "Bachelor of Arts in Literary and Cultural Studies",
    "Bachelor of Arts in Literature",
    "Bachelor of Arts in Mass Communication",
    "Bachelor of Arts in Mathematics",
    "Bachelor of Arts in Philosophy",
    "Bachelor of Arts in Physical Education",
    "Bachelor of Arts in Political Science",
    "Bachelor of Arts in Psychology",
    "Bachelor of Arts in Sociology",
    "Bachelor of Arts in Theology",
    "Bachelor of Early Childhood Education",
    "Bachelor of Elementary Education",
    "Bachelor of Fine Arts",
    "Bachelor of Forensic Science",
    "Bachelor of Industrial Technology",
    "Bachelor of Industrial Technology Management",
    "Bachelor of Laws",
    "Bachelor of Library and Information Science",
    "Bachelor of Multimedia Arts",
    "Bachelor of Music",
    "Bachelor of Music in Music Education Instrument Concentration",
    "Bachelor of Music in Music Education Voice Concentration",
    "Bachelor of Physical Education",
    "Bachelor of Public Administration",
    "Bachelor of Public Management",
    "Bachelor of Science in Accountancy",
    "Bachelor of Science in Accounting Information Systems",
    "Bachelor of Science in Accounting Technology",
    "Bachelor of Science in Aeronautical Engineering",
    "Bachelor of Science in Agribusiness",
    "Bachelor of Science in Agribusiness Economics",
    "Bachelor of Science in Agribusiness Management",
    "Bachelor of Science in Agricultural and Biosystems Engineering",
    "Bachelor of Science in Agricultural Economics",
    "Bachelor of Science in Agriculture",
    "Bachelor of Science in Agroforestry",
    "Bachelor of Science in Aircraft Maintenance Technology",
    "Bachelor of Science in Airline Management Accountancy",
    "Bachelor of Science in Applied Mathematics",
    "Bachelor of Science in Architecture",
    "Bachelor of Science in Aviation Electronics Technology",
    "Bachelor of Science in Aviation Management",
    "Bachelor of Science in Biology",
    "Bachelor of Science in Business Administration",
    "Bachelor of Science in Business Management",
    "Bachelor of Science in Chemical Engineering",
    "Bachelor of Science in Chemistry",
    "Bachelor of Science in Civil Engineering",
    "Bachelor of Science in Commerce",
    "Bachelor of Science in Community Development",
    "Bachelor of Science in Computer Engineering",
    "Bachelor of Science in Computer Science",
    "Bachelor of Science in Computer Technology",
    "Bachelor of Science in Criminology",
    "Bachelor of Science in Culinary Management",
    "Bachelor of Science in Customs Administration",
    "Bachelor of Science in Data Science",
    "Bachelor of Science in Development Anthropology",
    "Bachelor of Science in Development Communication",
    "Bachelor of Science in Disaster Resiliency and Management",
    "Bachelor of Science in E-Sports",
    "Bachelor of Science in Economics",
    "Bachelor of Science in Electrical Engineering",
    "Bachelor of Science in Electronics Engineering",
    "Bachelor of Science in Entertainment and Multimedia Computing",
    "Bachelor of Science in Entrepreneurship",
    "Bachelor of Science in Environmental Science",
    "Bachelor of Science in Finance",
    "Bachelor of Science in Fisheries",
    "Bachelor of Science in Food Technology",
    "Bachelor of Science in Forestry",
    "Bachelor of Science in General Biology",
    "Bachelor of Science in Geodetic Engineering",
    "Bachelor of Science in Geology",
    "Bachelor of Science in Guidance and Counseling",
    "Bachelor of Science in Hospitality Industry Management",
    "Bachelor of Science in Hospitality Management",
    "Bachelor of Science in Hotel and Restaurant Management",
    "Bachelor of Science in Human Resource Development Management",
    "Bachelor of Science in Human Resource Management",
    "Bachelor of Science in Industrial Engineering",
    "Bachelor of Science in Information Systems",
    "Bachelor of Science in Information Technology",
    "Bachelor of Science in Interior Design",
    "Bachelor of Science in Internal Auditing",
    "Bachelor of Science in International Studies",
    "Bachelor of Science in Legal Management",
    "Bachelor of Science in Management Accounting",
    "Bachelor of Science in Marine Biology",
    "Bachelor of Science in Marine Engineering",
    "Bachelor of Science in Marine Transportation",
    "Bachelor of Science in Marketing",
    "Bachelor of Science in Mathematics",
    "Bachelor of Science in Mechanical Engineering",
    "Bachelor of Science in Medical Technology/Medical Laboratory Science",
    "Bachelor of Science in Midwifery",
    "Bachelor of Science in Mining Engineering",
    "Bachelor of Science in Nursing",
    "Bachelor of Science in Nutrition and Dietetics",
    "Bachelor of Science in Occupational Therapy",
    "Bachelor of Science in Office Administration",
    "Bachelor of Science in Pharmacy",
    "Bachelor of Science in Pharmacy (2021)",
    "Bachelor of Science in Physical Therapy",
    "Bachelor of Science in Physical Therapy",
    "Bachelor of Science in Physics",
    "Bachelor of Science in Psychology",
    "Bachelor of Science in Public Administration",
    "Bachelor of Science in Radiologic Technology",
    "Bachelor of Science in Real Estate Management",
    "Bachelor of Science in Respiratory Therapy",
    "Bachelor of Science In Robotics Engineering",
    "Bachelor of Science in Sanitary Engineering",
    "Bachelor of Science in Social Services",
    "Bachelor of Science in Social Work",
    "Bachelor of Science in Statistics",
    "Bachelor of Science in Tourism Management",
    "Bachelor of Science in Travel Management",
    "Bachelor of Secondary Education",
    "Bachelor of Special Needs Education",
    "Bachelor of Technical Teacher Education",
    "Bachelor of Technical-Vocational Teacher Education",
    "Bachelor of Technology and Livelihood Education",
    "Batsilyer ng Sining sa Filipino",
    "Certificate in Preschool Education",
    "Certificate in Teacher Education",
    "Certificate of Agricultural Science",
    "Diploma in Agricultural Technology",
    "Diploma in Exercise and Sports Science",
    "Diploma in Fisheries Technology",
    "Diploma in Guidance and Counseling",
    "Diploma in Information Technology",
    "Diploma in Midwifery",
    "Diploma in Urban and Regional Planning",
    "Diploma of Technology",
    "Doctor in Business Administration",
    "Doctor in Public Administration",
    "Doctor of Business Management",
    "Doctor of Dental Medicine",
    "Doctor of Education",
    "Doctor of Engineering",
    "Doctor of Information Technology",
    "Doctor of Management",
    "Doctor of Medicine",
    "Doctor of Optometry",
    "Doctor of Philosophy",
    "Doctor of Philosophy by Research",
    "Doctor of Philosophy in Applied Linguistics",
    "Doctor of Philosophy in Criminal Justice",
    "Doctor of Philosophy in Economics",
    "Doctor of Philosophy in Education",
    "Doctor of Philosophy in Education Administration",
    "Doctor of Philosophy in Guidance and Counseling",
    "Doctor of Philosophy in Management",
    "Doctor of Philosophy in Mathematics",
    "Doctor of Philosophy in Nursing",
    "Doctor of Philosophy in Pharmacy",
    "Doctor of Philosophy in Social Development",
    "Doctor of Philosophy in Theology",
    "Doctor of Public Administration",
    "Doktor ng Pilosopiya sa Filipino",
    "e-Master in Business Administration",
    "Enhance Support Level Program for Marine Deck",
    "Graduate Certificate Program in Adult Formation in the Basic Certificate in Integral Evangelization",
    "Graduate Certificate Program in Adult Formation in the Basic Certificate in Pastoral Ministry",
    "Graduate Diploma in Econometrics",
    "Graduate Diploma in Economics",
    "Juris Doctor",
    "Ladderized Bachelor of Science in Fisheries",
    "Master in Business Administration",
    "Master in Business Administration for Health Professional",
    "Master in Counseling",
    "Master in Engineering",
    "Master in Environmental Planning",
    "Master in Fisheries Management",
    "Master in Guidance and Counseling",
    "Master in Industrial Counseling",
    "Master in Information System",
    "Master in Information Technology",
    "Master in International Tourism and Hospitality Management",
    "Master in Library and Information Science",
    "Master in Management",
    "Master in Marine Management",
    "Master in Nursing",
    "Master in Pastoral Ministry",
    "Master in Psychology",
    "Master in Public Administration",
    "Master in Science Teaching",
    "Master in Social Work",
    "Master in Urban and Regional Planning",
    "Master of Arts",
    "Master of Arts in Applied Social Research",
    "Master of Arts in Basic Education",
    "Master of Arts in Communication",
    "Master of Arts in Development Studies",
    "Master of Arts in Economics",
    "Master of Arts in Education",
    "Master of Arts in Educational Management",
    "Master of Arts in Elementary Education",
    "Master of Arts in Engineering Education",
    "Master of Arts in Guidance and Counseling",
    "Master of Arts in Home Economics",
    "Master of Arts in Hospital Administration",
    "Master of Arts in Industrial Counseling",
    "Master of Arts in Literature",
    "Master of Arts in Nursing",
    "Master of Arts in Pastoral Ministry",
    "Master of Arts in Religious Education",
    "Master of Arts in Science Teaching",
    "Master of Arts in Systematic Theology",
    "Master of Arts in Teaching Chemistry",
    "Master of Arts in Teaching College Chemistry",
    "Master of Arts in Teaching College Physics",
    "Master of Arts in Teaching English",
    "Master of Arts in Teaching English Language and Literature",
    "Master of Arts in Teaching Filipino",
    "Master of Arts in Teaching General Science",
    "Master of Arts in Teaching Mathematics",
    "Master of Arts in Teaching Physics",
    "Master of Arts in Theology",
    "Master of Arts in Tropical Risk Management",
    "Master of Arts in Values Education",
    "Master of Divinity",
    "Master of Education",
    "Master of Education in Exceptional Children",
    "Master of Education in Language Teaching",
    "Master of Education in Special Education",
    "Master of English in Applied Linguistics",
    "Master of Extension Education",
    "Master of Industrial Technology",
    "Master of Science in Accountancy",
    "Master of Science in Agricultural Economics",
    "Master of Science in Agriculture",
    "Master of Science in Anthropology",
    "Master of Science in Applied Mathematics",
    "Master of Science in Aquaculture",
    "Master of Science in Biology",
    "Master of Science in Chemistry",
    "Master of Science in Commerce",
    "Master of Science in Criminal Justice",
    "Master of Science in Criminology",
    "Master of Science in Development Administration",
    "Master of Science in Development Communication",
    "Master of Science in Development Communication Management",
    "Master of Science in Econometrics",
    "Master of Science in Economics",
    "Master of Science in Engineering",
    "Master of Science in Environmental and Resource Management",
    "Master of Science in Environmental Resources & Management",
    "Master of Science in Fisheries",
    "Master of Science in Food Science",
    "Master of Science in Forestry",
    "Master of Science in Guidance and Counseling",
    "Master of Science in Information Science",
    "Master of Science in Information Technology",
    "Master of Science in Library Information Science",
    "Master of Science in Local and Regional Governance",
    "Master of Science in Marine Biodiversity",
    "Master of Science in Marketing",
    "Master of Science in Medical Technology",
    "Master of Science in Pharmacy",
    "Master of Science in Psychology",
    "Master of Science in Pure and Applied Mathematics",
    "Master of Science in Radiologic Technology",
    "Master of Science in Social Work",
    "Master of Science in Teaching",
    "Master of Science in Teaching General Science",
    "Master of Technology Education",
    "Master of Vocational Education",
    "Masters in Community Health",
    "Masters in Health Profession Education",
    "Masters in Participatory Development",
    "Special Program-Bachelor of Science in Disaster Resiliency and Management",
    "Teacher Certificate Program",
    "Two-Year Aircraft Maintenance Technology",
    "Two-Year Aviation Electronics Technology",
  ];

  String major =
      'Associate in Arts in Sports Studies'; // Variable to store the selected blood type

  // List of blood types
  List<String> majors = [
    "Associate in Arts in Sports Studies",
    "Associate in Computer Technology",
    "Associate in Health Science Education",
    "Bachelor in Human Services",
    "Bachelor in Human Services major in Care of Older Persons",
    "Bachelor in Human Services major in Psychology",
    "Bachelor of Agricultural Technology",
    "Bachelor of Agricultural Technology major in Agricultural Technology",
    "Bachelor of Agricultural Technology major in Crop Science and Animal Science",
    "Bachelor of Arts in Anthropology",
    "Bachelor of Arts in Anthropology major in Academic Research",
    "Bachelor of Arts in Anthropology major in Community Development/Social Enterprise",
    "Bachelor of Arts in Anthropology major in IP Education",
    "Bachelor of Arts in Anthropology major in Leadership/Pre-Law",
    "Bachelor of Arts in Anthropology major in Medical Anthropology",
    "Bachelor of Arts in Broadcasting",
    "Bachelor of Arts in Christian Education",
    "Bachelor of Arts in Classical/Philosophy",
    "Bachelor of Arts in Communication",
    "Bachelor of Arts in Communication major in Journalism and Broadcasting",
    "Bachelor of Arts in Communication major in New Media Studies",
    "Bachelor of Arts in Communication major in Social Communications",
    "Bachelor of Arts in Developmental Studies",
    "Bachelor of Arts in Economics",
    "Bachelor of Arts in English Language",
    "Bachelor of Arts in General Science",
    "Bachelor of Arts in History",
    "Bachelor of Arts In Interdisciplinary Studies",
    "Bachelor of Arts In Interdisciplinary Studies major in Minor In Language And Literature",
    "Bachelor of Arts In Interdisciplinary Studies major in Minor In Media And Business",
    "Bachelor of Arts In Interdisciplinary Studies major in Minor In Media And Philosophy",
    "Bachelor of Arts In Interdisciplinary Studies major in Minor In Media And Technology",
    "Bachelor of Arts In Interdisciplinary Studies major in Minor In Philosophy And Theology",
    "Bachelor of Arts in International Studies major in American Studies",
    "Bachelor of Arts in International Studies major in Asian Studies",
    "Bachelor of Arts in International Studies major in Japanese Language and Studies",
    "Bachelor of Arts in Islamic Studies major in Political Economy",
    "Bachelor of Arts in Journalism",
    "Bachelor of Arts in Library Science",
    "Bachelor of Arts in Literary and Cultural Studies",
    "Bachelor of Arts in Literature",
    "Bachelor of Arts in Mass Communication",
    "Bachelor of Arts in Mathematics",
    "Bachelor of Arts in Multimedia",
    "Bachelor of Arts in Philosophy",
    "Bachelor of Arts in Philosophy major in Law",
    "Bachelor of Arts in Philosophy major in Management",
    "Bachelor of Arts in Physical Education",
    "Bachelor of Arts in Political Science",
    "Bachelor of Arts in Psychology",
    "Bachelor of Arts in Sociology",
    "Bachelor of Arts in Theology",
    "Bachelor of Arts in Theology major in Religious Education",
    "Bachelor of Culture and Arts Education",
    "Bachelor of Early Childhood Education",
    "Bachelor of Elementary Education",
    "Bachelor of Elementary Education major in Early Childhood Education",
    "Bachelor of Elementary Education major in English",
    "Bachelor of Elementary Education major in Filipino",
    "Bachelor of Elementary Education major in General Science",
    "Bachelor of Elementary Education major in Guidance and Counseling",
    "Bachelor of Elementary Education major in Mathematics",
    "Bachelor of Elementary Education major in Physical Education",
    "Bachelor of Elementary Education major in Pre-School Education",
    "Bachelor of Elementary Education major in Special Education",
    "Bachelor of Elementary Education major in Special Needs",
    "Bachelor of Fine Arts major in Fashion Design",
    "Bachelor of Fine Arts major in Industrial Design",
    "Bachelor of Fine Arts major in Painting",
    "Bachelor of Industrial Technology major in Automotive Technology",
    "Bachelor of Industrial Technology major in Civil Construction Technology",
    "Bachelor of Industrial Technology major in Electrical Technology",
    "Bachelor of Industrial Technology major in Electronics Technology",
    "Bachelor of Industrial Technology major in Mechanical Technology",
    "Bachelor of Industrial Technology major in Refrigeration & Airconditioning Technology",
    "Bachelor of Industrial Technology Management",
    "Bachelor of Laws",
    "Bachelor of Library and Information Science",
    "Bachelor of Multimedia Arts",
    "Bachelor of Music in Music Education Instrument Concentration",
    "Bachelor of Music in Music Education Voice Concentration",
    "Bachelor of Physical Education",
    "Bachelor of Public Administration",
    "Bachelor of Public Management",
    "Bachelor of Science in Accountancy",
    "Bachelor of Science in Accounting Information Systems",
    "Bachelor of Science in Accounting Technology",
    "Bachelor of Science in Aeronautical Engineering",
    "Bachelor of Science in Aerospace Engineering",
    "Bachelor of Science in Agribusiness",
    "Bachelor of Science in Agribusiness Economics",
    "Bachelor of Science in Agribusiness major in Enterprise Management",
    "Bachelor of Science in Agribusiness Management",
    "Bachelor of Science in Agricultural and Biosystems Engineering",
    "Bachelor of Science in Agricultural and Biosystems Engineering major in AB Machinery and Power Engineering",
    "Bachelor of Science in Agricultural and Biosystems Engineering major in AB Process Engineering",
    "Bachelor of Science in Agricultural and Biosystems Engineering major in AB Structures and Environment Engineering",
    "Bachelor of Science in Agricultural and Biosystems Engineering major in Land and Water Resources Engineering",
    "Bachelor of Science in Agricultural Economics major in Farm Management and Production Economics",
    "Bachelor of Science in Agricultural Economics major in Resource & Development Economics",
    "Bachelor of Science in Agriculture",
    "Bachelor of Science in Agriculture major in Agronomy",
    "Bachelor of Science in Agriculture major in Animal Science",
    "Bachelor of Science in Agriculture major in Cert. of Agric'l Science",
    "Bachelor of Science in Agriculture major in Crop Protection",
    "Bachelor of Science in Agriculture major in Crop Science",
    "Bachelor of Science in Agriculture major in Enterprise Management",
    "Bachelor of Science in Agriculture major in Entomology",
    "Bachelor of Science in Agriculture major in Horticulture",
    "Bachelor of Science in Agriculture major in Plant Pathology",
    "Bachelor of Science in Agroforestry",
    "Bachelor of Science in Aircraft Maintenance Technology",
    "Bachelor of Science in Airline Management Accountancy",
    "Bachelor of Science in Applied Mathematics",
    "Bachelor of Science in Architecture",
    "Bachelor of Science in Aviation Electronics Technology",
    "Bachelor of Science in Aviation Management major in Airline Operations",
    "Bachelor of Science in Biology",
    "Bachelor of Science in Biology major in Animal Biology",
    "Bachelor of Science in Biology major in Ecology",
    "Bachelor of Science in Biology major in General Biology",
    "Bachelor of Science in Biology major in Medical Biology",
    "Bachelor of Science in Biology major in Plant Biology",
    "Bachelor of Science in Business Administration",
    "Bachelor of Science in Business Administration major in Business Analytics",
    "Bachelor of Science in Business Administration major in Business Economics",
    "Bachelor of Science in Business Administration major in Digital Marketing",
    "Bachelor of Science in Business Administration major in Entrepreneurship",
    "Bachelor of Science in Business Administration major in Financial Management",
    "Bachelor of Science in Business Administration major in Human Resource Development Management",
    "Bachelor of Science in Business Administration major in Human Resource Management",
    "Bachelor of Science in Business Administration major in Management and Entrepreneurship",
    "Bachelor of Science in Business Administration major in Marketing Management",
    "Bachelor of Science in Business Administration major in Microfinance Management",
    "Bachelor of Science in Business Administration major in Operations Management",
    "Bachelor of Science in Business Management",
    "Bachelor of Science in Chemical Engineering",
    "Bachelor of Science in Chemistry",
    "Bachelor of Science in Civil Engineering",
    "Bachelor of Science in Civil Engineering major in Construction Engineering and Management",
    "Bachelor of Science in Civil Engineering major in Geotechnical",
    "Bachelor of Science in Civil Engineering major in Structural Engineering",
    "Bachelor of Science in Civil Engineering major in Transportation",
    "Bachelor of Science in Civil Engineering major in Water Resource",
    "Bachelor of Science in Commerce major in Banking and Finance",
    "Bachelor of Science in Commerce major in Business Administration",
    "Bachelor of Science in Commerce major in Economics",
    "Bachelor of Science in Commerce major in Financial and Management",
    "Bachelor of Science in Commerce major in Management",
    "Bachelor of Science in Community Development",
    "Bachelor of Science in Computer Engineering",
    "Bachelor of Science in Computer Science",
    "Bachelor of Science in Computer Technology",
    "Bachelor of Science in Criminology",
    "Bachelor of Science in Criminology major in Law Enforcement",
    "Bachelor of Science in Culinary Management",
    "Bachelor of Science in Customs Administration",
    "Bachelor of Science in Data Science",
    "Bachelor of Science in Development Anthropology",
    "Bachelor of Science in Development Communication",
    "Bachelor of Science in Disaster Resiliency and Management",
    "Bachelor of Science in Economics",
    "Bachelor of Science in Economics major in Development Economics",
    "Bachelor of Science in Economics major in Monetary & Financial Economics",
    "Bachelor of Science in Economics major in Resource & Environment Economics",
    "Bachelor of Science in Electrical Engineering",
    "Bachelor of Science in Electronics Engineering",
    "Bachelor of Science in Entertainment and Multimedia Computing",
    "Bachelor of Science in Entertainment and Multimedia Computing major in Digital Animation Technology",
    "Bachelor of Science in Entertainment and Multimedia Computing major in Game Development",
    "Bachelor of Science in Entrepreneurship",
    "Bachelor of Science in Entrepreneurship major in Agri- Business",
    "Bachelor of Science in Entrepreneurship major in Microfinance",
    "Bachelor of Science in Environmental Science",
    "Bachelor of Science in Finance",
    "Bachelor of Science in Fisheries",
    "Bachelor of Science in Fisheries major in Aquaculture",
    "Bachelor of Science in Fisheries major in Fish Processing",
    "Bachelor of Science in Food Technology",
    "Bachelor of Science in Forestry",
    "Bachelor of Science in General Biology",
    "Bachelor of Science in Geodetic Engineering",
    "Bachelor of Science in Geology",
    "Bachelor of Science in Hospitality Industry Management",
    "Bachelor of Science in Hospitality Management",
    "Bachelor of Science in Hospitality Management major in Culinary Arts Management",
    "Bachelor of Science in Hospitality Management major in Hotel Administration",
    "Bachelor of Science in Hospitality Management major in Hotel and Restaurant Management",
    "Bachelor of Science in Hotel and Restaurant Management",
    "Bachelor of Science in Human Resource Development Management",
    "Bachelor of Science in Human Resource Management",
    "Bachelor of Science in Industrial Engineering",
    "Bachelor of Science in Industrial Security Management",
    "Bachelor of Science in Information Systems",
    "Bachelor of Science in Information Technology",
    "Bachelor of Science in Information Technology major in Business Technology Management",
    "Bachelor of Science in Information Technology major in Information Security",
    "Bachelor of Science in Interior Design",
    "Bachelor of Science in Internal Auditing",
    "Bachelor of Science in Legal Management",
    "Bachelor of Science in Management Accounting",
    "Bachelor of Science in Marine Biology",
    "Bachelor of Science in Marine Engineering",
    "Bachelor of Science in Marine Transportation",
    "Bachelor of Science in Marketing",
    "Bachelor of Science in Mathematics",
    "Bachelor of Science in Mathematics major in Research Statistics",
    "Bachelor of Science in Mechanical Engineering",
    "Bachelor of Science in Medical Technology/Medical Laboratory Science",
    "Bachelor of Science in Midwifery",
    "Bachelor of Science in Mining Engineering",
    "Bachelor of Science in Nursing",
    "Bachelor of Science in Nutrition and Dietetics",
    "Bachelor of Science in Occupational Therapy",
    "Bachelor of Science in Office Administration",
    "Bachelor of Science in Office Administration major in Computer Education",
    "Bachelor of Science in Office Administration major in Office Management",
    "Bachelor of Science in Pharmacy",
    "Bachelor of Science in Pharmacy major in Clinical Pharmacy",
    "Bachelor of Science in Physical Therapy",
    "Bachelor of Science in Physics",
    "Bachelor of Science in Psychology",
    "Bachelor of Science in Radiologic Technology",
    "Bachelor of Science in Real Estate Management",
    "Bachelor of Science in Respiratory Therapy",
    "Bachelor of Science In Robotics Engineering",
    "Bachelor of Science in Sanitary Engineering",
    "Bachelor of Science in Social Services major in Care of Older Persons",
    "Bachelor of Science in Social Services major in Child Governance",
    "Bachelor of Science in Social Work",
    "Bachelor of Science in Statistics",
    "Bachelor of Science in Tourism Management",
    "Bachelor of Science in Travel Management",
    "Bachelor of Secondary Education",
    "Bachelor of Secondary Education major in Agri-Fishery Education",
    "Bachelor of Secondary Education major in Biological Sciences",
    "Bachelor of Secondary Education major in Catechetics",
    "Bachelor of Secondary Education major in English",
    "Bachelor of Secondary Education major in Filipino",
    "Bachelor of Secondary Education major in General Science",
    "Bachelor of Secondary Education major in Library Science",
    "Bachelor of Secondary Education major in Mathematics",
    "Bachelor of Secondary Education major in Music, Arts, Physical Education and Health",
    "Bachelor of Secondary Education major in Physical Science",
    "Bachelor of Secondary Education major in Science",
    "Bachelor of Secondary Education major in Social Science",
    "Bachelor of Secondary Education major in Social Studies",
    "Bachelor of Secondary Education major in Technology and Livelihood Education",
    "Bachelor of Secondary Education major in Values Education",
    "Bachelor of Secondary Education major in Values Education with emphasis in Christian Education",
    "Bachelor of Secondary Education major in Values Education with emphasis in Christian Music",
    "Bachelor of Secondary Education major in Values Education with emphasis in Christian Theology",
    "Bachelor of Special Needs Education",
    "Bachelor of Special Needs Education major in Early Childhood Education",
    "Bachelor of Special Needs Education major in Elementary School Teaching",
    "Bachelor of Special Needs Education major in Generalist New Curriculum",
    "Bachelor of Technical Teacher Education",
    "Bachelor of Technical Teacher Education major in Automotive Technology",
    "Bachelor of Technical Teacher Education major in Drafting Technology",
    "Bachelor of Technical Teacher Education major in Food and Service Management",
    "Bachelor of Technical-Vocational Teacher Education major in Animal Production",
    "Bachelor of Technical-Vocational Teacher Education major in Automotive Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Civil Construction Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Computer System Servicing",
    "Bachelor of Technical-Vocational Teacher Education major in Crop Production",
    "Bachelor of Technical-Vocational Teacher Education major in Drafting Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Electrical Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Electronics Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Food and Service Management",
    "Bachelor of Technical-Vocational Teacher Education major in Garments, Fashion And Design",
    "Bachelor of Technical-Vocational Teacher Education major in Heating, Ventilating, Air-conditioning and Refrigeration Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Mechanical Technology",
    "Bachelor of Technical-Vocational Teacher Education major in Organic Agriculture Production",
    "Bachelor of Technology and Livelihood Education",
    "Bachelor of Technology and Livelihood Education major in Agri-Fishery Arts",
    "Bachelor of Technology and Livelihood Education major in Home Economics",
    "Bachelor of Technology and Livelihood Education major in Industrial Technology",
    "Bachelor of Technology Teacher Education major in Automotive Technology",
    "Bachelor of Technology Teacher Education major in Civil Technology",
    "Bachelor of Technology Teacher Education major in Computer Technology",
    "Bachelor of Technology Teacher Education major in Electronics Technology",
    "Bachelor of Technology Teacher Education major in Mechanical Technology",
    "Batsilyer ng Sining sa Filipino",
    "Certificate in Preschool Education",
    "Certificate in Teacher Education",
    "Certificate of Agricultural Science",
    "Diploma in Agricultural Technology",
    "Diploma in Exercise and Sports Science",
    "Diploma in Fisheries Technology",
    "Diploma in Guidance and Counseling",
    "Diploma in Information Technology",
    "Diploma in Midwifery",
    "Diploma in Urban and Regional Planning",
    "Diploma of Technology major in Automotive Technology",
    "Diploma of Technology major in Electrical Technology",
    "Diploma of Technology major in Electronics Technology",
    "Diploma of Technology major in Hotel and Restaurant Technology",
    "Diploma of Technology major in Mechanical Technology",
    "Doctor in Business Administration",
    "Doctor in Public Administration",
    "Doctor of Business Management",
    "Doctor of Business Management major in Information System",
    "Doctor of Dental Medicine",
    "Doctor of Education major in Educational Leadership Management",
    "Doctor of Education major in Educational Management",
    "Doctor of Engineering",
    "Doctor of Information Technology",
    "Doctor of Management major in Human Resource Management",
    "Doctor of Medicine",
    "Doctor of Optometry",
    "Doctor of Philosophy by Research major in Agribusiness Management and Entrepreneurship",
    "Doctor of Philosophy by Research major in Agricultural and Applied Economics",
    "Doctor of Philosophy by Research major in Economics",
    "Doctor of Philosophy in Applied Linguistics",
    "Doctor of Philosophy in Biology major in Biodiversity",
    "Doctor of Philosophy in Criminal Justice major in Criminology",
    "Doctor of Philosophy in Economics",
    "Doctor of Philosophy in Education Administration",
    "Doctor of Philosophy in Education Administration major in Basic Education Administration",
    "Doctor of Philosophy in Education Administration major in Higher Education Administration",
    "Doctor of Philosophy in Education major in Applied Linguistics",
    "Doctor of Philosophy in Education major in Educational Leadership",
    "Doctor of Philosophy in Education major in Information Technology",
    "Doctor of Philosophy in Education major in Physical Education",
    "Doctor of Philosophy in Environmental Science major in Resource Management",
    "Doctor of Philosophy in Management",
    "Doctor of Philosophy in Mathematics",
    "Doctor of Philosophy in Pharmacy",
    "Doctor of Philosophy in Social Development",
    "Doctor of Philosophy in Theology",
    "Doctor of Philosophy major in Business Administration",
    "Doctor of Philosophy major in Clinical Psychology",
    "Doctor of Philosophy major in Development Administration",
    "Doctor of Philosophy major in Development Research and Administration",
    "Doctor of Philosophy major in Development Studies",
    "Doctor of Philosophy major in Educational Management",
    "Doctor of Philosophy major in Guidance and Counseling",
    "Doctor of Philosophy major in Horticulture",
    "Doctor of Philosophy major in Nursing",
    "Doctor of Philosophy major in Organization Studies",
    "Doctor of Philosophy major in Theology",
    "Doctor of Public Administration",
    "Doktor ng Pilosopiya sa Filipino",
    "e-Master in Business Administration major in Enterprise Development",
    "Enhance Support Level Program for Marine Deck",
    "Graduate Certificate Program in Adult Formation in the Basic Certificate in Integral Evangelization",
    "Graduate Certificate Program in Adult Formation in the Basic Certificate in Pastoral Ministry",
    "Graduate Diploma in Econometrics",
    "Graduate Diploma in Economics",
    "Juris Doctor",
    "Master in Business Administration",
    "Master in Business Administration for Health Professional",
    "Master in Business Administration major in Agribusiness Development",
    "Master in Business Administration major in Agricultural Business Management",
    "Master in Business Administration major in Cooperative Management",
    "Master in Business Administration major in Corporate Management",
    "Master in Business Administration major in Enterprise Development",
    "Master in Business Administration major in Enterprise Management",
    "Master in Business Administration major in Hospitality Management",
    "Master in Business Administration major in Human Resource and Org. Development",
    "Master in Business Administration major in State Enterprise Management",
    "Master in Counseling",
    "Master in Engineering",
    "Master in Engineering major in Chemical Engineering",
    "Master in Engineering major in Civil Engineering",
    "Master in Engineering major in Computer Engineering",
    "Master in Engineering major in Electrical Engineering",
    "Master in Engineering major in Electronics and Communication Engineering",
    "Master in Engineering major in Electronics Engineering",
    "Master in Engineering major in Environmental Engineering",
    "Master in Engineering major in Industrial Engineering",
    "Master in Engineering major in Innovation Management",
    "Master in Engineering major in Mechanical Engineering",
    "Master in Engineering major in Renewable Energy",
    "Master in Engineering major in Water Resource Engineering",
    "Master in Environmental Planning",
    "Master in Fisheries Management major in Aquaculture Technology",
    "Master in Fisheries Management major in Fish Processing",
    "Master in Guidance and Counseling major in Guidance and Counseling",
    "Master in Industrial Counseling major in Industrial Counseling",
    "Master in Information System",
    "Master in Information Technology",
    "Master in International Tourism and Hospitality Management",
    "Master in Library and Information Science",
    "Master in Management",
    "Master in Management major in Human Resource Management",
    "Master in Marine Management",
    "Master in Nursing",
    "Master in Pastoral Ministry",
    "Master in Psychology",
    "Master in Public Administration",
    "Master in Public Administration major in Fiscal Administration",
    "Master in Public Administration major in Government Administration",
    "Master in Public Administration major in Local Governance",
    "Master in Public Administration major in Local Governance Administration",
    "Master in Public Administration major in Local Governance and Administration",
    "Master in Public Administration major in Organization and Management",
    "Master in Public Administration major in Organization Studies",
    "Master in Public Administration major in Public Fiscal Administration",
    "Master in Public Administration major in Public Policy",
    "Master in Public Administration major in Public Policy and Program Administration",
    "Master in Public Administration major in Public Safety Administration",
    "Master in Science Teaching major in Biology",
    "Master in Science Teaching major in General Science",
    "Master in Science Teaching major in Mathematics",
    "Master in Science Teaching major in Physical Science",
    "Master in Social Work major in Direct Social Work Practice",
    "Master in Social Work major in Social Administration",
    "Master in Urban and Regional Planning",
    "Master of Arts in Applied Social Research",
    "Master of Arts in Basic Education major in English Teaching",
    "Master of Arts in Basic Education major in Mathematics Teaching",
    "Master of Arts in Basic Education major in Science Teaching",
    "Master of Arts in Communication",
    "Master of Arts in Development Studies",
    "Master of Arts in Economics major in Economics",
    "Master of Arts in Education major in Basic Education Teaching English",
    "Master of Arts in Education major in Basic Education Teaching Mathematics",
    "Master of Arts in Education major in Basic Education Teaching Science",
    "Master of Arts in Education major in Early Childhood Education",
    "Master of Arts in Education major in Education Management",
    "Master of Arts in Education major in Educational Administration",
    "Master of Arts in Education major in Educational Management",
    "Master of Arts in Education major in Educational Planning & Management",
    "Master of Arts in Education major in Elementary Education",
    "Masterof Arts in Education major in English",
    "Master of Arts in Education major in English Language Teaching",
    "Master of Arts in Education major in Filipino",
    "Master of Arts in Education major in Guidance and Counseling",
    "Master of Arts in Education major in Information Technology Integration",
    "Master of Arts in Education major in Language Teaching",
    "Master of Arts in Education major in Library Science",
    "Master of Arts in Education major in Mathematics",
    "Master of Arts in Education major in Mathematics Teaching",
    "Master of Arts in Education major in Physical Education",
    "Master of Arts in Education major in Science Teaching",
    "Master of Arts in Education major in Social Studies",
    "Master of Arts in Education major in Sociology",
    "Master of Arts in Education major in SPED Area 1 - Teaching Learners with Auditory Disabilities",
    "Master of Arts in Education major in SPED Area 2 - Teaching Learners with Intellectual Disabilities",
    "Master of Arts in Education major in SPED Area 3 - Teaching Children with Developmental and Behavior Problems",
    "Master of Arts in Education major in SPED Area 4 - Generalist: A Modular Approach",
    "Master of Arts in Education major in SPED Area 5 - Teaching Learners with Learning Disabilities",
    "Master of Arts in Education major in Teaching English",
    "Master of Arts in Education major in Teaching Filipino",
    "Master of Arts in Education major in Teaching General Science",
    "Master of Arts in Education major in Teaching Mathematics",
    "Master of Arts in Education major in Teaching Physical Education",
    "Master of Arts in Education major in Teaching Religion",
    "Master of Arts in Education major in Teaching Science",
    "Master of Arts in Education major in Technology and Livelihood Education",
    "Master of Arts in Educational Management",
    "Master of Arts in Elementary Education",
    "Master of Arts in Engineering Education",
    "Master of Arts in Guidance and Counseling",
    "Master of Arts in Home Economics major in Home Economics",
    "Master of Arts in Hospital Administration",
    "Master of Arts in Industrial Counseling major in Industrial Counseling",
    "Master of Arts in Literature",
    "Master of Arts in Nursing",
    "Master of Arts in Nursing major in Clinical Management",
    "Master of Arts in Nursing major in Nursing Administration",
    "Master of Arts in Pastoral Ministry",
    "Master of Arts in Religious Education",
    "Master of Arts in Science Teaching major in Biology",
    "Master of Arts in Science Teaching major in Physics",
    "Master of Arts in Systematic Theology major in Dogmatic Theology, Biblical Theology, Moral Theology",
    "Master of Arts in Teaching Chemistry",
    "Master of Arts in Teaching College Chemistry",
    "Master of Arts in Teaching College Physics",
    "Master of Arts in Teaching English",
    "Master of Arts in Teaching Filipino",
    "Master of Arts in Teaching Mathematics",
    "Master of Arts in Teaching Mathematics major in Mathematics",
    "Master of Arts in Teaching Physics major in Physics",
    "Master of Arts in Theology",
    "Master of Arts in Theology major in Christian Family Life",
    "Master of Arts in Theology major in Christian Stewardship Studies",
    "Master of Arts in Theology major in Human and Christic Peace Studies",
    "Master of Arts in Theology major in Missiology",
    "Master of Arts in Theology major in Pastoral Ministry",
    "Master of Arts in Theology major in Religious Education",
    "Master of Arts in Theology major in Theological Studies",
    "Master of Arts in Tropical Risk Management",
    "Master of Arts in Values Education",
    "Master of Arts major in Anthropology",
    "Master of Arts major in Economics",
    "Master of Arts major in English",
    "Master of Arts major in English Education",
    "Master of Arts major in Guidance and Counseling",
    "Master of Arts major in Philosophy",
    "Master of Divinity major in Biblical Studies",
    "Master of Education in Exceptional Children major in Blind & Visually Impaired",
    "Master of Education in Exceptional Children major in Mentally Gifted and Mentally Handicapped",
    "Master of Education in Language Teaching major in English",
    "Master of Education in Special Education major in Blind & Visually Impaired",
    "Master of Education in Special Education major in Gifted & Talented",
    "Master of Education in Special Education major in Hearing Impairment",
    "Master of Education in Special Education major in Intellectual Disability",
    "Master of Education in Special Education major in Mentally Gifted and Mentally Handicapped",
    "Master of Education in Special Education major in Visual Impairment",
    "Master of Education major in Alternative Learning System",
    "Master of Education major in Early Childhood Education",
    "Master of Education major in Educational Management",
    "Master of Education major in Guidance and Counseling",
    "Master of Education major in Instructional Leadership",
    "Master of English in Applied Linguistics",
    "Master of Extension Education",
    "Master of Industrial Technology major in Automotive Technology",
    "Master of Industrial Technology major in Electrical Technology",
    "Master of Industrial Technology major in Electronics Technology",
    "Master of Industrial Technology major in Mechanical Technology",
    "Master of Science in Accountancy",
    "Master of Science in Agricultural Economics",
    "Master of Science in Agriculture major in Agronomy",
    "Master of Science in Agriculture major in Animal Science",
    "Master of Science in Agriculture major in Crop Protection",
    "Master of Science in Agriculture major in Horticulture",
    "Master of Science in Agriculture major in Soil Science",
    "Master of Science in Anthropology",
    "Master of Science in Applied Mathematics",
    "Master of Science in Aquaculture",
    "Master of Science in Biology",
    "Master of Science in Commerce",
    "Master of Science in Criminal Justice major in Criminology",
    "Master of Science in Criminology major in Criminalistics",
    "Master of Science in Criminology major in Law Enforcement Administration",
    "Master of Science in Development Administration",
    "Master of Science in Development Communication",
    "Master of Science in Development Communication Management",
    "Master of Science in Econometrics",
    "Master of Science in Economics",
    "Master of Science in Engineering major in Land and Water Resources Engineering Technology",
    "Master of Science in Environmental and Resource Management",
    "Master of Science in Environmental Science",
    "Master of Science in Fisheries major in Aquaculture",
    "Master of Science in Food Science",
    "Master of Science in Forestry major in Forest Resource Management",
    "Master of Science in Guidance and Counseling",
    "Master of Science in Information Science",
    "Master of Science in Information Technology",
    "Master of Science in Library Information Science",
    "Master of Science in Local and Regional Governance",
    "Master of Science in Marine Biodiversity",
    "Master of Science in Marketing",
    "Master of Science in Medical Technology",
    "Master of Science in Pharmacy",
    "Master of Science in Psychology",
    "Master of Science in Psychology major in Clinical Psychology",
    "Master of Science in Psychology major in Industrial Psychology",
    "Master of Science in Psychology major in Psychology",
    "Master of Science in Pure and Applied Mathematics",
    "Master of Science in Radiologic Technology",
    "Master of Science in Social Work major in Advanced Social Work Practice-Clinical Setting",
    "Master of Science in Social Work major in Applied Social Work Practice-Community based setting",
    "Master of Science in Teaching General Science major in General Science",
    "Master of Science on Medical Technology major in Biomedical Science",
    "Master of Technology Education",
    "Master of Vocational Education",
    "Masters in Community Health",
    "Masters in Health Profession Education",
    "Masters in Participatory Development",
    "Post Baccalaureate Diploma in Alternative Learning System",
    "Teacher Certificate Program",
    "Two-Year Aircraft Maintenance Technology",
    "Two-Year Aviation Electronics Technology"
  ];

// Use this function with the picked file

  List<Map<String, dynamic>> files = [];

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('SO')
                          .where('userId',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where('status', isEqualTo: 'Active')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('error');
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: data.docs.length.toString(),
                                  fontSize: 42,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'Active S.O',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: 50,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('SO')
                          .where('userId',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where('status', isEqualTo: 'Accepted')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('error');
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: data.docs.length.toString(),
                                  fontSize: 42,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'Accepted S.O',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: 50,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('SO')
                          .where('userId',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where('status', isEqualTo: 'Rejected')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('error');
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: data.docs.length.toString(),
                                  fontSize: 42,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'Rejected S.O',
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Bold',
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const UsersHomeScreen()));
                    },
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('SO')
                      .where('userId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < data.docs.length; i++)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                text:
                                                    '${data.docs[i]['day']}-${data.docs[i]['month']}-${data.docs[i]['year']}',
                                                fontSize: 14,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.group,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          TextWidget(
                                            text: '1',
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
                                          onPressed: () {
                                            fname.text = data.docs[i]['fname'];
                                            lname.text = data.docs[i]['lname'];
                                            mname.text = data.docs[i]['mname'];
                                            extension.text =
                                                data.docs[i]['extension'];
                                            extension.text =
                                                data.docs[i]['extension'];
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: TextWidget(
                                                    text: 'Details',
                                                    fontSize: 18,
                                                    fontFamily: 'Bold',
                                                  ),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFieldWidget(
                                                          isEnabled: false,
                                                          controller: fname,
                                                          label: 'First Name'),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFieldWidget(
                                                          isEnabled: false,
                                                          controller: lname,
                                                          label: 'Last Name'),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFieldWidget(
                                                          isEnabled: false,
                                                          controller: mname,
                                                          label: 'Middle Name'),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextFieldWidget(
                                                          isEnabled: false,
                                                          controller: extension,
                                                          label:
                                                              'Extension (II, IV, Jr., Sr., etc)'),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Course: ${data.docs[i]['course']}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Major:  ${data.docs[i]['major']}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
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
                                          },
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
                    );
                  }),
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
          content: StatefulBuilder(builder: (context, setState) {
            return SizedBox(
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
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.file_copy,
                          ),
                          title: TextWidget(
                            text: files[index]['name'],
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: ButtonWidget(
                      label: 'Upload File',
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        try {
                          if (result != null) {
                            PlatformFile pickedFile = result.files.single;
                            String fileName = pickedFile.name;
                            Reference firebaseStorageRef =
                                FirebaseStorage.instance.ref().child(fileName);
                            UploadTask uploadTask =
                                firebaseStorageRef.putData(pickedFile.bytes!);

                            TaskSnapshot taskSnapshot =
                                await uploadTask.whenComplete(() => null);

                            // Get the download URL of the uploaded file
                            String downloadURL =
                                await taskSnapshot.ref.getDownloadURL();

                            setState(() {
                              files.add({
                                'name': fileName,
                                'link': downloadURL,
                              });
                            });

                            print(
                                "File uploaded to Firebase Storage. Download URL: $downloadURL");
                          } else {
                            // Handle case where user canceled the picker
                            print("User canceled the file picker");
                          }
                        } catch (e) {
                          print("Error uploading file to Firebase Storage: $e");
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          }),
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
                addSO(fname.text, lname.text, mname.text, extension.text,
                    course, major, grad.text, start.text, end.text, files);
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
