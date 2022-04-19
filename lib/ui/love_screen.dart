import 'package:flutter/material.dart';

class LoveScreen extends StatefulWidget {
  const LoveScreen({Key? key}) : super(key: key);

  @override
  _LoveScreenState createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          '즐겨찾기한 페이지',
          style: TextStyle(color: Colors.black45),
        ),
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}
