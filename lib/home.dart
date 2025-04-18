import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'message.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Message()),);
              },
              icon: Icon(LineIcons.comment)
          ),
        ],
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
