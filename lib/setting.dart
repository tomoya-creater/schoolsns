import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Setting"),
      ),
      body: Center(
        child: Column(
          children: [
            //直してません
            Card(
              color: Colors.blue.withOpacity(0.5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Image.network("https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg") as IconData?),
                      Text('Name'),
                    ],
                  ),
                  TextButton(
                      onPressed: null,
                      child:  Text('account,develop,cash,delete'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
