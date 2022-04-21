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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            _buildTitle(context),
            // _buildSelectMenu(context),
          ],
        ));
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, // 주 축 기준 중앙
        crossAxisAlignment: CrossAxisAlignment.center, // 교차 축 기준 중앙
        children: const <Widget>[
          FlutterLogo(),
          Text('Hello, Flutter Beginner!'),
          Icon(Icons.sentiment_very_satisfied),
        ]);
  }
}
