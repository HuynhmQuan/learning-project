import 'package:flutter/material.dart';
import 'package:flutter_test_project_1/catalog_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerName = TextEditingController(
    text: 'quan',
  );
  final TextEditingController _controllerPw = TextEditingController(
    text: '123',
  );

  final String name = 'quan';

  final String pw = '123';

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerName.dispose();
    _controllerPw.dispose();
    super.dispose();
  }

  void checkLoginPress() {
    if (_controllerName.text == name && _controllerPw.text == pw) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const CatalogPage();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Lỗi đăng nhập',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            content: const Text(
              "Đăng nhập sai tên hoặc mật khẩu. Vui lòng nhập lại",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Sử dụng Navigator.pop để ĐÓNG popup này lại
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(color: Colors.amber)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 30.0),

            TextField(
              controller: _controllerName,
              decoration: const InputDecoration(
                // 1. Trạng thái mặc định khi CHƯA nhấn vào
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Đường viền dưới mặc định màu xám
                    width: 1.0,
                  ),
                ),

                // 2. Trạng thái khi ĐÃ NHẤN VÀO (Focus)
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber, // Đường viền dưới chuyển sang màu vàng (hoặc Colors.yellow)
                    width: 1.0, // Làm đường viền dày lên một chút khi focus để nổi bật hơn
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14.0),

            TextField(
              controller: _controllerPw,
              decoration: const InputDecoration(
                // 1. Trạng thái mặc định khi CHƯA nhấn vào
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Đường viền dưới mặc định màu xám
                    width: 1.0,
                  ),
                ),

                // 2. Trạng thái khi ĐÃ NHẤN VÀO (Focus)
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber, // Đường viền dưới chuyển sang màu vàng (hoặc Colors.yellow)
                    width: 1.0, // Làm đường viền dày lên một chút khi focus để nổi bật hơn
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25.0),

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(0.0),
                ),
              ),
              onPressed: () {
                checkLoginPress();
              },
              child: const Text(
                'ENTER',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
