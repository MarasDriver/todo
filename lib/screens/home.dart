import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> my_tasks = [];
  Map<String, dynamic> my_firstmap = {
    "Czekboks": false,
    "Tekts": "test",
  };

  @override
  void initState() {
    super.initState();
    my_tasks.add(my_firstmap);
  }

  TextEditingController controller = TextEditingController();

  String my_input = "";

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
          my_add_button(),
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
                // onChanged: (string) {
                //   setState(() {
                //     my_input = string;
                //     my_tasks.add(my_input);
                //   });
                //   ;
                // },
                controller: controller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    prefixIcon: my_add_button(), border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
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

  IconButton my_add_button() {
    return IconButton(
      onPressed: () {
        setState(() {
          // my_tasks.add(controller.text);
          controller.clear();
        });
      },
      icon: Icon(Icons.add),
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
                text: my_tasks[index].values.elementAt(1).toString(),
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
