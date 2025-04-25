import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sns/search.dart';
import 'package:sns/setting.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<TimeLine> {
  bool isStoryVisible = false;
  bool isMagicTagEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text("Timeline"),
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            _showSettingsMenu(context);
          },
        ),
        actions: [
          IconButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()),);
              },
              icon: Icon(LineIcons.search),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Timeline'),
          ],
        ),
      ),
    );
  }

  void _showSettingsMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
      items: [
        PopupMenuItem(
          enabled: false,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  SwitchListTile(
                    title: const Text('ストーリ表示'),
                    value: isStoryVisible,
                    onChanged: (bool value) {
                      setState(() {
                        isStoryVisible = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('MagicTag有効'),
                    value: isMagicTagEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        isMagicTagEnabled = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('MagicTagは有効です。')),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('その他設定'),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      Navigator.pop(context); // メニューを閉じる
                      // 設定画面への遷移やその他の処理をここに追加
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()),);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}