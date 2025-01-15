// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

// class NewFile extends StatefulWidget {
//   const NewFile({super.key});

//   @override
//   State<NewFile> createState() => _NewFileState();
// }

// class _NewFileState extends State<NewFile> {
//   Database? dataBase;
//   TextEditingController name = TextEditingController();
//   TextEditingController age = TextEditingController();
//   TextEditingController grade = TextEditingController();
//   late List<Map> studentsData = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     createDatabase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xff0140a2),
//         title: const Text("Data base example"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: name,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff321a70))),
//                   labelText: "Name",
//                   labelStyle: TextStyle(color: Color(0xff321a70)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: age,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff321a70))),
//                   labelText: "Age",
//                   labelStyle: TextStyle(color: Color(0xff321a70)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: grade,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xff321a70))),
//                   labelText: "Grade",
//                   labelStyle: TextStyle(color: Color(0xff321a70)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               MaterialButton(
//                 onPressed: () async {
//                   if (name.text.isEmpty ||
//                       age.text.isEmpty ||
//                       grade.text.isEmpty) {
//                     log("Empty field");
//                   } else {
//                     log("1-Insert to DB=========================");
//                     await insertToDatabase(
//                         name: name.text,
//                         age: int.parse(age.text),
//                         grade: grade.text);
//                     log("2-Delete text fields=========================");
//                     name.clear();
//                     age.clear();
//                     grade.clear();
//                     log("3-Get data from DB=========================");
//                     getDataFromDataBase();
//                     log(
//                         "4-DONE! Getting data from DB=========================");
//                   }
//                 },
//                 color: const Color(0xff321a70),
//                 textColor: Colors.white,
//                 child: const Text('Submit'),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ListView.builder(
//                   padding: const EdgeInsets.all(8),
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: studentsData.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text(studentsData[index]["name"]),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(studentsData[index]["age"].toString()),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(studentsData[index]["grade"]),
//                       ],
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void createDatabase() async {
//     try {
//       dataBase = await openDatabase(
//         "students.db",
//         version: 1,
//         onCreate: (database, version) async {
//           await database.execute(
//               'CREATE TABLE students (id INTEGER PRIMARY KEY,name TEXT,age INTEGER,grade TEXT)');
//           log('Database created========================');
//         },
//       );
//     } catch (e) {
//       log('Error opening database: $e ========================');
//     }
//   }

//   Future insertToDatabase({
//     required String name,
//     required int age,
//     required String grade,
//   }) async {
//     try {
//       await dataBase?.transaction(
//         (txn) {
//           log("Inserted ======================");
//           return txn.execute(
//             'INSERT INTO students(name,age,grade) VALUES("$name","$age","$grade")',
//           );
//         },
//       );
//     } catch (error) {
//       log("error in insert is $error ======================");
//     }
//   }

//   Future<void> getDataFromDataBase() async {
//     try {
//       final data = await dataBase?.query('students');
//       setState(() {
//         studentsData = data ?? [];
//       });
//       log("  ======================  $studentsData");
//     } catch (e) {
//       log('  ======================  Error getting data: $e');
//     }
//   }
// }
