import 'package:crud/add.dart';
import 'package:crud/student_model.dart';
import 'package:crud/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Student Details",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: student_model_class.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(8),
            leading: CircleAvatar(
              child: Text(
                student_model_class[index].student_name[0],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              radius: 30,
            ),
            title: Text(student_model_class[index].student_name +
                " " +
                "GR-ID(" +
                student_model_class[index].student_grid +
                ")"),
            subtitle: Text(student_model_class[index].student_standard),
            trailing: Container(
              width: width * 24.5 / 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => add(
                            gr_id: student_model_class[index].student_grid,
                            name: student_model_class[index].student_name,
                            std: student_model_class[index].student_standard,
                            index: index,
                          ),
                        ));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          student_model_class.removeAt(index);
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => add(),
          ));
        },
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
