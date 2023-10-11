import 'package:flutter/material.dart';
import 'package:new_project_1/screens/home_page.dart';

void main() {
  runApp(const myApp());
}


class myApp extends StatelessWidget {
  const myApp({Key?key}) :super(key:key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title:"Flutter Demo",
      theme: ThemeData(
        primarySwatch:Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
    );
  }
}





