import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screen/addScreen.dart';

class listTitle extends StatefulWidget {
  listTitle(this.task, this.index, {super.key});
  Task task;
  int index;
  @override
  State<listTitle> createState() => _listTitleState();
}

class _listTitleState extends State<listTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.task.title!,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => addScreen(
                                task: widget.task,
                              ))));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  int index;
                  index = box.toMap().length - 1;
                  if (index >= 0) box.deleteAt(index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.amber,
            height: 20.0,
            thickness: 2.0,
          ),
          Text(
            widget.task.note!,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
