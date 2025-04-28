import 'package:flutter/material.dart';
// Setting screen をインポート
import 'package:sns/setting.dart';

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
        actions: [
          // 設定アイコンを追加
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Setting 画面に遷移し、changeTheme 関数を渡す
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(changeTheme: changeTheme),
                ),
              );
            },
          ),
        ],
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
