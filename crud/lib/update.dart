import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
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
          title: Text("Update Student Data", style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 22
          ),),
          automaticallyImplyLeading: false,
          leading: InkWell(onTap:() {
            Navigator.of(context).pop();
          },
              child: Icon(CupertinoIcons.back, color: Colors.blueAccent,)),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: width * 80 / 100,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter GR-ID",
                      hintStyle: TextStyle(color: CupertinoColors.label),
                      focusColor: Colors.blueAccent
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: width * 80 / 100,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: CupertinoColors.label),
                      focusColor: Colors.blueAccent
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: width * 80 / 100,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Std",
                      hintStyle: TextStyle(color: CupertinoColors.label),
                      focusColor: Colors.blueAccent
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 8,left: 10,right: 10),
                  child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
