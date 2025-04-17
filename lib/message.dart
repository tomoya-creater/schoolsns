import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index){
                InkWell(
                  onTap: (){
                  },
                  child: Row(
                    children: [
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
