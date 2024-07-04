import 'package:flutter/material.dart';
// import 'package:greensage/graph_all.dart';
// import 'package:greensage/home_page_model.dart';
import 'package:greensage/home_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
       debugShowCheckedModeBanner: false,
        home: const HomePageWidget(),
    );
  }
}
