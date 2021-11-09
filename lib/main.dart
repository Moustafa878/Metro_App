import 'package:flutter/material.dart';
import 'package:graduation_project/User_Details.dart';
import 'package:provider/provider.dart';
import 'Create_Account.dart';
void main()=>runApp(MyApp());

class  MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<UserDetailsProvider>(
      create: (context)=>UserDetailsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Create_Account()
       )

      );
  }

}
