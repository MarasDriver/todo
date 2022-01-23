import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<String> my_tasks = [
    "pranie1",
    "pranie2",
    "pranie3",
  ];

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
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 11,
              height: 100.0,
              color: Colors.green,
              child: MyTextWidget(
                text: "input",
                color: Colors.black,
                size: 20.5,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: my_tasks.length,
              itemBuilder: (context, index) {
                return Text(index.toString());
              })
        ],
      ),
    );
  }
}
