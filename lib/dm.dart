import 'package:flutter/material.dart';

class DM extends StatelessWidget {
  const DM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Message"),
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
