
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_project/views/chat/third_page.dart';
import 'package:real_estate_project/views/home/leads_page.dart';
import 'package:real_estate_project/views/projects/projects_page.dart';
import 'form_page.dart';


void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const HomePage(), const SecondHomePage(),const ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Leads",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context) => formPage(),
          ),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
      body: _pages[_currentIndex],
    );
  }
}