import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'message.dart';

class DM extends StatelessWidget {
  const DM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DM"),
      ),
      body: const Center(
        child: Column(
          children: [
            Row(
              children: [

              ],
            ),
            Row(
              children: [
                Card(
                  color: Colors.brown,
                  child: Column(
                    children: [
                      Row(
                        children: [

                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
