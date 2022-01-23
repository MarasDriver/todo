import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<String> my_tasks = [
    "pranie1",
    "pranie2",
    "pranie3",
  ];
  TextEditingController controller = TextEditingController();

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
              // height: 100.0,
              color: Colors.green,
              child: TextFormField(
                onChanged: (string) {
                  print(string);
                },
                controller: controller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: my_tasks.length,
                itemBuilder: (context, index) {
                  return mytask(index);
                }),
          )
        ],
      ),
    );
  }

  Widget mytask(int index) {
    bool ischecked = false;
    return Dismissible(
      key: UniqueKey(),
      // onDismissed: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(value: ischecked, onChanged: (ischecked) {}),
              MyTextWidget(
                text: my_tasks[index].toString(),
                color: Colors.red,
                size: 25,
              ),
            ],
          ),
          const Divider(
            color: Colors.red,
            thickness: 10,
          )
        ],
      ),
    );
  }
}
