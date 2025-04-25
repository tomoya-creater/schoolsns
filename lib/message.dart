import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('message'),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index){
                InkWell(
                  onTap: (){
                    null;
                  },
                  child: Row(
                    children: [

                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
