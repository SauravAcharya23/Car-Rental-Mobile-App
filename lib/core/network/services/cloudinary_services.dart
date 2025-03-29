import 'dart:convert';
import 'dart:io';

import 'package:car_rental_app/core/network/services/database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;



// Uploading files to cloudinary

Future<bool> uploadToCloudinary(FilePickerResult? filePickerResult, String brandname)async{
  if(filePickerResult == null || filePickerResult.files.isEmpty){
    print("No file selected!");
    return false;
  }

  File file = File(filePickerResult.files.single.path!);

  String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';

  // Create a MultipartRequest to upload the file
  var uri = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/raw/upload");
  var request = http.MultipartRequest("POST", uri);


  // Read the file content as bytes
  var fileBytes = await file.readAsBytes();

  var multipartfile = http.MultipartFile.fromBytes(
    'file', 
    fileBytes,
    filename: file.path.split("/").last
  );

  // Add the file part to the request
  request.files.add(multipartfile);

  request.fields['upload_preset'] = "car-rental";
  request.fields['resource_type'] = "raw";


  // Send the request and await the response
  var response = await request.send();

  //Get the response as text
  var responseBody = await response.stream.bytesToString();

  // Print the response
  print(responseBody);

  if(response.statusCode == 200){

    var jsonResponse = jsonDecode(responseBody);

    await DatabaseService().addBrand(
      brandName: brandname,
      image: filePickerResult.files.first.name,
      url: jsonResponse['secure_url'],
      createdAt: jsonResponse['created_at'],
    );
    
    print("Upload successful!");
    return true;
  }else{
    print("Upload failed with status: ${response.statusCode}");
    return false;
  }

}