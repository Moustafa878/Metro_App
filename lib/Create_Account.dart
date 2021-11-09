import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:graduation_project/DrawerWith_INFO.dart';
import 'package:graduation_project/EditProfile.dart';
import 'package:graduation_project/User_Details.dart';
import 'package:graduation_project/Edit_Profile_Page.dart';
import 'package:graduation_project/image_style.dart';
import 'package:provider/provider.dart';

class Create_Account extends StatelessWidget{
  final GlobalKey<FormState> tfs=GlobalKey<FormState>();
  UserDetailsProvider use=new UserDetailsProvider();


  demo(){
    final formatdata=tfs.currentState;
    if(formatdata.validate()){
      formatdata.save();

    }

  }
Widget textFieldStandard(var s,IconData i){
  return Consumer<UserDetailsProvider>(builder:(context,userprovider,child,){
    return   TextFormField(
      validator: (val){
        if (val.isEmpty){
          return "Enter  ${s}";
        }else
          return null;

      },
      onSaved: (val){
        if(s=="Full Name"){
          userprovider.name=val;
        } else if(s=="E-mail") {
          userprovider.email=val;
        }else if(s=="Phone Number") {
          userprovider.phone=val;
        }else if(s=="Credit Card") {
          userprovider.credit=val;
        }
      },
      cursorColor: Colors.deepOrange,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),

        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange,),
          borderRadius:  BorderRadius.circular(100),

        ),

        labelText: s,
        labelStyle: TextStyle(color: Colors.blueGrey),
        icon:Icon(i, size: 30,color:Colors.deepOrange ),


      ),
      autocorrect: true,
    );

  }) ;
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("images/im5.jpg"),
                      fit: BoxFit.cover,
                    )
                ),

                child: Center(
                    child: Consumer<UserDetailsProvider>(builder:(context,userprovider,child,) {
                      return GestureDetector(
                          /*onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                         },*/
                        child:Container(

                        height: 160.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                          color: Color(0xff7c94b6),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:userprovider.pickedImage==null?AssetImage(userprovider.image) :FileImage(userprovider.pickedImage),
                            fit: BoxFit.cover,


                          ),
                          border: Border.all(color: Colors.black54, width: 5.0),
                          // borderRadius: BorderRadius.all(const Radius.circular(80.0)),

                        ),

                       child: IconButton(
                          padding: EdgeInsets.only(bottom: 200, left: 120),
                          hoverColor: Colors.deepOrange,
                          highlightColor: Colors.blue,
                          icon: Icon(Icons.add_a_photo, size: 40,
                            color: Colors.black,),
                          /*onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                          },*/
                        ),
                      )
                      );
                    }),


                ),

              ),

            ),



            Expanded(

                child:Form(
                    key: tfs,
                    child:  ListView(
                    scrollDirection: Axis.vertical,
                     children: <Widget>[

                       Container(

                         height: 30,
                         alignment: Alignment.center,
                         child: Text(
                           "Create Account",
                           style: TextStyle(
                             color: Colors.deepOrange,
                             fontSize: 30,
                             fontWeight: FontWeight.w600,
                             fontStyle: FontStyle.italic
                           ),
                         ),
                       ),

                       SizedBox(height: 10,),
                       textFieldStandard("Full Name", Icons.person),
                       SizedBox(height: 5,),
                       textFieldStandard( "E-mail", Icons.email),
                       SizedBox(height: 5,),
                       Consumer<UserDetailsProvider>(builder:(context,userprovider,child,){


                         return   TextFormField(

                           validator: (val){
                             if (val.isEmpty){
                               return "Enter Password";
                             }else
                               return null;

                           },
                           onSaved: (val){
                             userprovider.pass=val;
                           },
                           cursorColor: Colors.deepOrange,
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(100),
                             ),
                             focusedBorder:OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.deepOrange,),
                               borderRadius:  BorderRadius.circular(100),
                             ),
                             labelText: "${userprovider.pass}",
                             icon:Icon(Icons.security, size: 30,color:Colors.deepOrange ,),
                             suffixIcon: IconButton(
                                 icon: Icon(Icons.visibility),
                                 color: userprovider.showPassword ? Colors.deepOrange : Colors.blueGrey,
                                 onPressed: (){
                                   userprovider.showPassword = !userprovider.showPassword;
                                  userprovider.validate();
                             },
                               highlightColor: Colors.deepOrange,
                              // color: Colors.blueGrey,

                             ),

                           ),

                           autocorrect: true,
                           obscureText:!userprovider.showPassword,
                         );

                       }),
                       SizedBox(height: 5,),
                       textFieldStandard( "Phone Number", Icons.phone_android),
                       SizedBox(height: 5,),
                       textFieldStandard( "Credit Card", Icons.credit_card),
                       SizedBox(height: 50,),
                       Consumer<UserDetailsProvider>(builder:(context,userprovider,child,){
                            return Center(
                               child: Container(
                                   height: 50,
                                   width: 300,
                                   child: RaisedButton(
                                     onPressed: () {
                                       //if  (userprovider.validate())
                                         //navigate to main screen
                                      //else
                                         //show messsage that this
                                       userprovider.validate();
                                       demo();
                                       print("creaaaaaaaaaat1");

                                     },
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     color: Colors.blueGrey[900],
                                     colorBrightness: Brightness.dark,
                                     textColor: Colors.white,
                                     child: Text(
                                       "Create",
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),
                                     ),
                                     highlightColor: Colors.deepOrange,
                                   )
                               ),
                             );
                       }),
                         SizedBox(height: 20,),
                         IconButton(
                           icon: Icon(Icons.edit),
                           onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_profile()));


                           },),
                       SizedBox(height: 20,),
                       IconButton(
                         icon: Icon(Icons.drag_handle),
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerWithINfO()));},

                       )


                     ],

                )
                ),
            ),

          ],
        ),
      ),
    );



  }

}