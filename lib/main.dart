import 'package:flutter/material.dart';
import 'package:job_sourcing_platform/master.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Sourcing Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Master(),
    );
  }
}

