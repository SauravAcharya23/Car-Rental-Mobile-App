import 'dart:io';

import 'package:car_rental_app/core/network/services/cloudinary_services.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/core/ui/string_constrants.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/presentation/view/pages/Admin/Drawer/drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddBrandsPage extends ConsumerStatefulWidget {
  const AddBrandsPage({super.key});

  @override
  ConsumerState<AddBrandsPage> createState() => _AddBrandsPageState();
}

class _AddBrandsPageState extends ConsumerState<AddBrandsPage> {

  final brandNameController = TextEditingController();
  final fileController = TextEditingController();

  FilePickerResult? _filePickerResult;
  // PlatformFile? _pickedFile;
  final _pickedFile = StateProvider.autoDispose<PlatformFile?>((ref) => null,);

  final _isLoading = StateProvider.autoDispose<bool>((ref) => false,);

  final _formKey = GlobalKey<FormState>();
  

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false, allowedExtensions: ["png",'jpg'], type: FileType.custom
    );

    _filePickerResult = result;
    // setState(() {
    //   _pickedFile = result?.files.first;
    // });
    ref.read(_pickedFile.notifier).state = result?.files.first;
    

    if (result != null) {
      String fileName = result.files.single.name;
      fileController.text = fileName;
    }
  }

  // Future<File> resizeImage(File file) async {
  //   final result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     '${file.parent.path}/compressed.jpg',
  //     quality: 85, // Adjust quality
  //     minWidth: 200, // Set new width
  //     minHeight: 200, // Set new height
  //   );

  //   return File(result!.path);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Brand")),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: "Brand Name", 
                hideText: false, 
                controller: brandNameController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add brand name";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Select a file", 
                hideText: false, 
                controller: fileController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                readOnly: true,
                validate: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please select a file";
                  }else{
                    return null;
                  }
                },
                onTap: () => _pickFile(),
              ),
              if(ref.watch(_pickedFile) != null) //_pickedFile != null
                Container(
                  color: colorBlue,
                  child: Image.file(
                    File(ref.read(_pickedFile.notifier).state!.path!), //_pickedFile!.path!
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )
                ),
              
              const Gap(40),
              ref.watch(_isLoading) == true
              ? CircularProgressIndicator()
              : MyButton(
                bottonName: "Add Brand", 
                onTap: ()async{
                  if(_formKey.currentState != null){
                    if(_formKey.currentState!.validate()){
                      ref.read(_isLoading.notifier).state = true; // Use `read` for updates
                      // print("Objextssssssss: ${_filePickerResult?.files.single.name}");
                      final result = await uploadToCloudinary(_filePickerResult, brandNameController.text.trim().toString());
                      if(result){
                        SnackBarHelper.showSuccessSnackBar(context, uplaodFileSuccess);
                      }else{
                        SnackBarHelper.showSuccessSnackBar(context, uploadFileError);
                      }
                      brandNameController.clear();
                      fileController.clear();
                      // _pickedFile == null;
                      ref.read(_pickedFile.notifier).state = null; // Properly reset _pickedFile
                      ref.read(_isLoading.notifier).state = false; // Use `read` for updates
                    }
                  }
                  
                }
              )
            ],
          ),
        ),
      )
    );
  }
}