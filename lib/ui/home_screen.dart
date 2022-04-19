import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_kit_ver1/model/photo.dart';
import 'package:flutter_kit_ver1/ui/login_screen.dart';
import 'package:flutter_kit_ver1/ui/love_screen.dart';
import 'package:flutter_kit_ver1/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List<Photo> _photos = [];

  // 빈 리스트로 초기화 하는 단계
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=24806100-af9f83f3fdbb69c73da3e93f1&q=$query&image_type=photo&pretty=true'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // map 형태로 얻은 데이터는 Json 형태처럼 사용이 가능 해 진다.

    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

  // controller 사용시에는 dispose 필수
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 가운데에 오게 하기
        centerTitle: true,
        title: const Text(
          'Wedding',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            color: Colors.black26,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoveScreen(),
                  ));
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
            ),
          ),
          IconButton(
            color: Colors.black26,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
        // 그림자 없애기
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _controller,
              // 사용자가 글자를 입력할 때, 컨트롤러를 통해서 text 로 값을 알 수 있다.
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    // click 했을 때 하는 부분
                    final photos = await fetch(_controller.text);
                    setState(() {
                      _photos = photos;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            // Expanded 를 입혀주면 화면에 꽉 차는 효과가 생겨 에러가 해결된다.
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2열짜리
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return PhotoWidget(
                  photo: photo,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
