import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  String user_Email = '';
  String password = '';
  String username = '';
  String userMobile='';

  File? imageFile;

  //late String user = 'mobile apps';
  //late String pass = 'sherpur';

  @override
  void initState() {
    // TODO: implement initState
    this.user_Email = user_Email;
    this.password = password;
    this.username=username;
    this.userMobile=userMobile;
    getString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffdb98),
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        title: Center(child: Text("Profile",style: TextStyle(color: Color(0xFF876555),fontSize: 28),)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 48,
              ),
              Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 40,
                    child: displaySignatureFile(),
                  ),
                ),
              ),
              Center(
                child: TextButton(onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 100,
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      _getFromcamera();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Camera")),
                                TextButton(
                                    onPressed: () {
                                      _getFromGallery();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Gallery"))
                              ],
                            ),
                          ),
                        );
                      });}, child: Text("Choose your photo")),
              ),

              Align(
                alignment: Alignment.centerLeft,
                  child: Text("Email: $user_Email",style: TextStyle(fontSize: 16),)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("password: $password",style: TextStyle(fontSize: 16),)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("User Name: $username",style: TextStyle(fontSize: 16),)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("User Mobile: $userMobile",style: TextStyle(fontSize: 16),)),



            ],
          ),
        ),
      ),
    );
  }


   getString() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      user_Email = prefs.getString("user_Email") ?? "null";
      password = prefs.getString("user_password") ?? "null";
      username=prefs.getString("userName")!;
      userMobile= prefs.getString("user_phone")!;
    });

    //return user_name;
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromcamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget displaySignatureFile() {
    return new SizedBox(
      height: 200,
      width: 200,
      child: imageFile == null
          ? new Icon(Icons.camera_alt, size: 50)
          : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: new Image.file(imageFile!, fit: BoxFit.fill),
            ),
    );
  }
}
