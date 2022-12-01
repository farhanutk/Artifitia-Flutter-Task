import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<List> getCourses() async {
  await Firebase.initializeApp();
  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('courses');

  final response = await firestore.get();
  List data = response.docs.map((doc) => doc.data()).toList();
  print(data);

  return data;
}
