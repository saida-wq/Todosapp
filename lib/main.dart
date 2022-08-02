// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app_lesson10_1/widgets/counter.dart';
import 'package:todo_app_lesson10_1/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}
//class of task
class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  //list of todos
  List allTasks = [
    Task(title: "Publish video", status: true),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: true),
    Task(title: "call mom", status: true),
  ];
  
  //To remove when clicking pn "delete" icon on todo
  delete(int gey) {
    setState(() {
      allTasks.remove(allTasks[gey]);
    });
  }


//remove all todos when clicking on delete icon on the appbar

  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }
//change state of the todo cmplited or not when clik to todo 
  changeStatus(int taskindex) {
    setState(() {
      allTasks[taskindex].status = !allTasks[taskindex].status;
    });
  }
//add new todo when clik on add in the dialog widget
  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }
//create controller to get inside the textfiled
  final myController = TextEditingController();
//to calculate only completed todos
  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "Add new Task")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
                allTodos: allTasks.length,
                allCompleted: calculateCompletedTasks()),
            Container(
              margin: EdgeInsets.only(top: 26),
              height: 500,
              color: Colors.grey[600],
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todecard(
                      //I will pass all these information when create the Todocard() widget i todo 
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      myfunc: changeStatus,
                      lk: index,
                      well: index,
                      delete: delete,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
