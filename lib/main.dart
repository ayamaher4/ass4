import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/TodoModel.dart';

import 'TaskModel.dart';
import 'new_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Tasks'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All Tasks",
              ),
              Tab(
                text: "Complete Tasks",
              ),
              Tab(
                text: "InComplete Tasks",
              ),
            ],
            isScrollable: true,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NewTask();
                },
              ));
            }),
        body: TabBarView(
          children: [
            AllTasks(),
            CompleteTask(),
            INCompleteTask(),
          ],
        ),
        Column(
          children: [
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(60)),
                        color: Colors.white),
                    child: Consumer<TodoModel>(
                      builder: (context, todo, child) {
                        return ListView.builder(
                            itemCount: todo.taskList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(
                                      left: 32, right: 32, top: 8, bottom: 8),
                                  title: Text(
                                    todo.taskList[index].title,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    todo.taskList[index].detail,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(
                                    Icons.check_circle,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                margin:
                                    EdgeInsets.only(bottom: 8, left: 16, right: 16),
                              );
                            });
                      },
                    )),
              ),
          ],
        )
      ),
    );
  }
}

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(children: taskList.map((e) => TaskWidget(e)).toList()),
    )
        );
  }
}

class CompleteTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(children: taskList.map((e) => TaskWidget(e)).toList()),
    )
        );
  }
}

class INCompleteTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(children: taskList.map((e) => TaskWidget(e)).toList()),
    )
        );
  }
}

