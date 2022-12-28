import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/task.dart';
import 'package:todo/todo/todo.dart';

class addScreen extends StatefulWidget {
  addScreen({this.task, super.key});
  Task? task;
  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _taskTitle = TextEditingController(
        text: widget.task == null ? null : widget.task!.title!);
    TextEditingController _taskNote = TextEditingController(
        text: widget.task == null ? null : widget.task!.note!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text(
          widget.task == null ? "Add You Task" : "Update Your Task",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Task Title",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _taskTitle,
              decoration: InputDecoration(
                fillColor: Colors.amber.shade200.withAlpha(50),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Input Your Task or Any Activity",
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Your Task Note",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 25,
              controller: _taskNote,
              decoration: InputDecoration(
                fillColor: Colors.amber.shade200.withAlpha(50),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Write Some Note",
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  child: RawMaterialButton(
                    onPressed: () async {
                      var newTask = Task(
                        title: _taskTitle.text,
                        note: _taskNote.text,
                        date: DateTime.now(),
                        done: false,
                      );
                      Box<Task> taskBox = Hive.box<Task>("tasks");
                      if (widget.task != null) {
                        widget.task!.title = newTask.title;
                        widget.task!.note = newTask.note;
                        widget.task!.save();
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Todo())));
                      } else {
                        await taskBox.add(newTask);
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Todo())));
                      }
                    },
                    fillColor: Colors.blue,
                    child: Text(
                      widget.task == null ? "Add The New Task" : "Update Task",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
