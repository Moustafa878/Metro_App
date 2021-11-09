import 'package:flutter/material.dart';
import 'package:graduation_project/User_Details.dart';
import 'package:provider/provider.dart';

import 'Edit_Profile_Page.dart';

class DrawerWithINfO extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("welcome")),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(children: <Widget>[
                 Consumer<UserDetailsProvider>(builder:(context,userprovider,child,){
                  return Center(child: GestureDetector(

                    onLongPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                    },
                    child: Container(
                      width:100 ,
                      height: 100,
                   decoration: BoxDecoration(
                   color: Color(0xff7c94b6),
                   shape: BoxShape.circle,
                   image: DecorationImage(
                   image:userprovider.pickedImage==null?AssetImage(userprovider.image) :FileImage(userprovider.pickedImage),
                   fit: BoxFit.cover,


                   ),
                     border: Border.all(color: Colors.black54, width: 5.0,),
                    ),

                    )));
               }),
                SizedBox(height: 10,),
                Consumer<UserDetailsProvider>(builder:(context,userprovider,child,){
                  return Center(
                    child: Text('${userprovider.name}',style:TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize:18 )),
                  );
                }),
              ],),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}