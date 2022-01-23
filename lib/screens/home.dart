import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(
          text: 'Things to do:',
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Brawo");
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
