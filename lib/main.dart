import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sns/funhub.dart';
import 'package:sns/dm.dart';
import 'package:sns/like.dart';
import 'package:sns/timeline.dart';
import 'package:sns/user.dart';

// MyApp のインスタンスを保持するための GlobalKey
final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

void main() => runApp(MyAppWrapper()); // MyAppWrapper を呼び出すように変更

// ThemeMode を管理するための StatefulWidget
class MyAppWrapper extends StatefulWidget {
  @override
  _MyAppWrapperState createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  ThemeMode _themeMode = ThemeMode.system; // 初期テーマモード（システム設定に従う）

  // テーマモードを変更する関数
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        // Directionality を MaterialApp の builder 内に移動
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'GNav',
      // ライトテーマの定義
      theme: ThemeData(
        brightness: Brightness.light, // 明示的にライトモードを指定
        primaryColor: Colors.blue, // ライトテーマのプライマリカラー
        scaffoldBackgroundColor: Colors.white, // ライトテーマの背景色
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // ライトテーマの AppBar 背景色
          foregroundColor: Colors.white, // ライトテーマの AppBar テキスト/アイコン色
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // ライトテーマのボトムナビゲーション背景色
          selectedItemColor: Colors.blue, // 選択されたアイテムの色
          unselectedItemColor: Colors.grey, // 選択されていないアイテムの色
        ),
        cardColor: Colors.white, // カードの色
        // 他のライトテーマ設定...
      ),
      // ダークテーマの定義
      darkTheme: ThemeData(
        brightness: Brightness.dark, // 明示的にダークモードを指定
        primaryColor: Colors.indigo, // ダークテーマのプライマリカラー
        scaffoldBackgroundColor: Colors.black, // ダークテーマの背景色
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900], // ダークテーマの AppBar 背景色
          foregroundColor: Colors.white, // ダークテーマの AppBar テキスト/アイコン色
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // ダークテーマのボトムナビゲーション背景色
          selectedItemColor: Colors.indigo, // 選択されたアイテムの色
          unselectedItemColor: Colors.grey[600], // 選択されていないアイテムの色
        ),
        cardColor: Colors.grey[850], // カードの色
        // 他のダークテーマ設定...
      ),
      themeMode: _themeMode, // 現在のテーマモードを適用
      // MyApp に GlobalKey とテーマ変更関数を渡す
      home: MyApp(key: myAppKey, changeTheme: changeTheme),
    );
  }
}


class MyApp extends StatefulWidget {
  // テーマ変更関数を受け取るためのコンストラクタパラメータを追加
  final Function(ThemeMode) changeTheme;
  const MyApp({required Key key, required this.changeTheme}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  // Setting screen にテーマ変更関数を渡すため、User ウィジェットを更新
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      TimeLine(), // TimeLine にも changeTheme を渡す必要がある場合、コンストラクタを修正
      Like(),
      FunHub(),
      DM(),
      // User ウィジェットに changeTheme 関数を渡す
      User(changeTheme: widget.changeTheme),
    ];
  }


  @override
  Widget build(BuildContext context) {
    // 現在のテーマを取得
    final theme = Theme.of(context);
    // ボトムナビゲーションバーの背景色とアイコン色をテーマに合わせて設定
    final bottomNavBarColor = theme.bottomNavigationBarTheme.backgroundColor ?? theme.canvasColor;
    final activeColor = theme.bottomNavigationBarTheme.selectedItemColor ?? theme.primaryColor;
    final inactiveColor = theme.bottomNavigationBarTheme.unselectedItemColor ?? theme.disabledColor;
    final tabBackgroundColor = theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[300]; // タブ背景色

    return Scaffold(
      // Scaffold の背景色は MaterialApp の theme/darkTheme で設定されるため削除
      // backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bottomNavBarColor, // テーマに合わせた背景色
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              // 影の色もテーマに合わせるとより自然
              color: theme.brightness == Brightness.dark ? Colors.white10 : Colors.black12,
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: GNav(
              // テーマに合わせた色設定
              rippleColor: activeColor.withOpacity(0.1),
              hoverColor: activeColor.withOpacity(0.1),
              gap: 4,
              activeColor: activeColor, // アクティブなアイコンとテキストの色
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: tabBackgroundColor ?? Colors.grey, // タブの背景色
              color: inactiveColor, // 非アクティブなアイコンとテキストの色
              tabs: const [ // const を追加可能であれば追加
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Notify',
                ),
                GButton(
                  icon: LineIcons.gamepad,
                  text:'FunHub',
                ),
                GButton(
                  icon: LineIcons.mailBulk,
                  text: 'Message',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
