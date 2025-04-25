import 'package:flutter/material.dart';

class Like extends StatelessWidget {
  const Like({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notify"),
      ),
      body: Center(
        child:Column(
          children: [
            Text('Like'),
          ],
        ),
      ),
    );
  }
}
