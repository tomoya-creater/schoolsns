import 'package:flutter/material.dart';

class Setting extends StatefulWidget { // StatefulWidget に変更
  // テーマ変更関数を受け取る
  final Function(ThemeMode) changeTheme;

  const Setting({super.key, required this.changeTheme}); // コンストラクタを修正

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> { // State クラスを作成
  // 現在のテーマモードを取得するヘルパー関数
  ThemeMode _getCurrentThemeMode(BuildContext context) {
    // MaterialApp の themeMode を直接参照できないため、
    // brightness から判断するか、上位の Widget (MyAppWrapper) から受け取る必要がある。
    // ここでは単純化のため、現在の brightness から判断する。
    // より堅牢な実装は Provider 等の状態管理を使うことを推奨。
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }


  @override
  Widget build(BuildContext context) {
    // 現在のテーマモードを取得
    final currentThemeMode = _getCurrentThemeMode(context);
    // ダークモードが有効かどうかの bool 値
    final isDarkMode = currentThemeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Setting"),
      ),
      body: ListView( // Column の代わりに ListView を使用してスクロール可能に
        children: [
          // ダークモード切り替えスイッチ
          SwitchListTile(
            title: Text('ダークモード'),
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode), // アイコンも変更
            value: isDarkMode,
            onChanged: (bool value) {
              // value が true ならダークモード、false ならライトモードに切り替え
              widget.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
              // 注意: この画面自体は setState を呼ばなくても MaterialApp が再ビルドされるため更新される
            },
          ),
          Divider(), // 区切り線
          // 元々あった Card の部分（テーマに合わせて調整）
          Card(
            // Card の色はテーマから取得するように変更
            // color: Colors.blue.withOpacity(0.5), // 固定色ではなくテーマに合わせる
            margin: EdgeInsets.all(16.0), // 余白を追加
            child: Padding( // Card 内に Padding を追加
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Icon の表示方法を修正 (Image.network は IconData ではない)
                      // 例: Flutter ロゴアイコンを使用
                      Icon(Icons.flutter_dash, size: 30), // アイコンサイズ調整
                      SizedBox(width: 16), // アイコンとテキストの間隔
                      Text('アカウント情報', style: Theme.of(context).textTheme.titleMedium), // テキストスタイルをテーマに合わせる
                    ],
                  ),
                  SizedBox(height: 16), // Row と TextButton の間隔
                  TextButton(
                    onPressed: () {
                      // アカウント関連の処理
                    },
                    child: Text('アカウント設定など'), // テキストを具体的に
                  ),
                ],
              ),
            ),
          ),
          // 他の設定項目があればここに追加
        ],
      ),
    );
  }
}
