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
                      Icon(Image.asset()),
                      Text('Name'),
                    ],
                  ),
                  TextButton(
                      onPressed: ,
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
