import 'package:flutter/material.dart';
import 'package:flutter_kit_ver1/data/api.dart';
import 'package:flutter_kit_ver1/model/photo.dart';
import 'package:flutter_kit_ver1/ui/login_screen.dart';
import 'package:flutter_kit_ver1/ui/love_screen.dart';
import 'package:flutter_kit_ver1/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List<Photo> _photos = [];
  // 빈 리스트로 초기화 하는 단계

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
