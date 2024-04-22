import 'package:crud/home.dart';
import 'package:crud/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  final String? gr_id;
   final String? name;
   final String? std;
   final int? index;
  const add({super.key,  this.gr_id,  this.name,  this.std, this.index});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController grid_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController std_controller = TextEditingController();
  final student_formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.gr_id!=null && widget.name!=null && widget.std!=null){
      grid_controller.text=widget.gr_id!;
      name_controller.text=widget.name!;
      std_controller.text=widget.std!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Student Data",
            style: TextStyle(color: Colors.blueAccent, fontSize: 22),
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                CupertinoIcons.back,
                color: Colors.blueAccent,
              )),
        ),
        body: Center(
          child: Form(
            key: student_formkey,
            child: Column(
              children: [
                Container(
                  width: width * 80 / 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter GR-ID";
                      }
                    },
                    controller: grid_controller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter GR-ID",
                        hintStyle: TextStyle(color: CupertinoColors.label),
                        focusColor: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: width * 80 / 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      }
                    },
                    controller: name_controller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Name",
                        hintStyle: TextStyle(color: CupertinoColors.label),
                        focusColor: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: width * 80 / 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Std";
                      }
                    },
                    controller: std_controller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter Std",
                        hintStyle: TextStyle(color: CupertinoColors.label),
                        focusColor: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    if(student_formkey.currentState!.validate()){
                        String name = name_controller.text;
                        String grid = grid_controller.text;
                        String std = std_controller.text;
                        setState(() {
                          student_model_class.add(student_model(
                            student_name: name,
                            student_grid: grid,
                            student_standard: std,
                          ));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(),));
                        });
                    }
                  },
                  child: (widget.index==null)?Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 10, right: 10),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ):InkWell(
                    onTap: (){
                      student_model contact=student_model(student_name: name_controller.text, student_grid: grid_controller.text, student_standard: std_controller.text);
                      setState(() {
                        student_model_class[widget.index!]=contact;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                              padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 10),
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
