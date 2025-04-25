import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.blue..withOpacity(0.5),
              child: Row(
                children: [
                  TextField(),
                  IconButton(onPressed: null, icon: Icon(LineIcons.search)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
