import 'package:flutter/material.dart';

class User extends StatelessWidget {
  // テーマ変更関数を受け取る
  final Function(ThemeMode) changeTheme;

  const User({super.key, required this.changeTheme}); // コンストラクタを修正

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 中央寄せ
          children: [
            Text('User Profile Screen'),
            // 必要に応じて他のユーザー情報を表示
          ],
        ),
      ),
    );
  }
}
