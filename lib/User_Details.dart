import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
/*Future<File> getImageFileFromAssets(String path) async {
 final byteData = await rootBundle.load('assets/$path');
 final file = File('${(await getTemporaryDirectory()).path}/$path');
 await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
 return file;
}*/
/*File urlToFile(String imageUrl)  {
// generate random number.
 var rng = new Random();
// get temporary directory of device.
 Directory tempDir =  getTemporaryDirectory() as Directory;
// get temporary path from temporary directory.
 String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
 File file = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// call http.get method and pass imageUrl into it to get response.
 http.Response response =  http.get(imageUrl) as http.Response;
// write bodyBytes received in response to file.
  file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
 return file;
}*/

class UserDetailsProvider extends ChangeNotifier{
var name="Full Name";
var email="Email";
var pass="Password";
var phone="Phone Number";
var credit="Credit Card";
var image="images/im7.png";
File pickedImage= null;
bool showPassword = false;
var count =0;

 validate(){
count++;
// validate that user not in database

notifyListeners();
}

}
