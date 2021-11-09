import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/User_Details.dart';
import 'package:graduation_project/image_style.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';



class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{


  File _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/im4.jpg"),
                  fit: BoxFit.cover,

            ),
              gradient:LinearGradient(
                colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.3)
                ]
              ),
          ),
        child:ListView(padding: EdgeInsets.only(top:150 ,right: 20,left: 20),
          children: <Widget>[
            Center(
              child: GestureDetector(
                 onLongPress: ()=> _showPickOptionsDialog(context),
                  child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[900],
                  radius: 80,
                  child: _pickedImage== null ? Text("Long press"): null,
                  backgroundImage:
                  _pickedImage != null ? FileImage(_pickedImage): null,
                ),
              )
            ),
            const SizedBox(height: 10.0),

            Consumer<UserDetailsProvider>(builder:(context,userprovider,child,) {
              return RaisedButton(
                onPressed:(){
                  userprovider.pickedImage=_pickedImage;
                  userprovider.validate();
                  //print(_pickedImage);
                } ,
                child: Text("Save "),
              );
            }),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ),

    );
  }

  _loadPicker(ImageSource source) async {

    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked);
    }
    Navigator.pop(context);
  }

  _cropImage(File picked) async {

    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );

    if (cropped != null) {
      setState(() {
        _pickedImage = cropped;

      });
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a pictuer"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }

}