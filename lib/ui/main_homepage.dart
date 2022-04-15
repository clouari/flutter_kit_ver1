import 'package:flutter/material.dart';

class MainHomepage extends StatefulWidget {
  const MainHomepage({Key? key}) : super(key: key);

  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<MainHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플랫폼 틀 잡기'),
      ),
      body: Container(),
    );
    ;
  }
}
