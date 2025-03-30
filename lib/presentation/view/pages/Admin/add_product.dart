import 'dart:io';

import 'package:car_rental_app/core/network/services/cloudinary_services.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/core/ui/string_constrants.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/my_bottomsheet.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/presentation/view/pages/Admin/Drawer/drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage({super.key});

  @override
  ConsumerState<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {

  final nameController = TextEditingController();
  final imageUrlController = TextEditingController();
  final colorController = TextEditingController();
  final seatController = TextEditingController();
  final powerController = TextEditingController();
  final maxSpeedController = TextEditingController();
  final acclerationController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final gearboxController = TextEditingController();
  final brandController = TextEditingController();

  final List<String> _items = ["Automatic", "Petrol", "Disel"];

  final _isLoading = StateProvider.autoDispose<bool>((ref) => false,);

  FilePickerResult? _filePickerResult;
  // PlatformFile? _pickedFile;
  final _pickedFile = StateProvider.autoDispose<PlatformFile?>((ref) => null,);

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
      imageUrlController.text = fileName;
    }
  }

  void _showBottomSheet(){
    myBottomSheet(
      context: context, 
      items: _items, 
      onItemSelected: (selectedItem) {
        setState(() {
          gearboxController.text = selectedItem;
        });
      },
    );
  }
  void brandBottomSheet(){
    myBottomSheet(
      context: context, 
      items: null, 
      onItemSelected: (selectedItem) {
        setState(() {
          brandController.text = selectedItem;
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,
         child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: "Product Name", 
                hideText: false, 
                controller: nameController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add product name";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Choose Brand", 
                hideText: false,
                readOnly: true, 
                controller: brandController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please choose brand";
                  }else{
                    return null;
                  }
                },
                suffixIcon: Icon(Icons.arrow_drop_down),
                onTap: brandBottomSheet
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product Color", 
                hideText: false, 
                controller: colorController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add color";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Choose Gearbox", 
                hideText: false,
                readOnly: true, 
                controller: gearboxController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please choose gearbox";
                  }else{
                    return null;
                  }
                },
                suffixIcon: Icon(Icons.arrow_drop_down),
                onTap: _showBottomSheet
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Total Seats", 
                hideText: false, 
                controller: seatController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                keyboardtype: TextInputType.number,
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add seats";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product Power", 
                hideText: false, 
                controller: powerController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add power";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product Max Speed", 
                hideText: false, 
                controller: maxSpeedController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                keyboardtype: TextInputType.number,
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add max speed";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product accleration", 
                hideText: false, 
                controller: acclerationController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add accleration";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product rating", 
                hideText: false, 
                controller: ratingController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                keyboardtype: TextInputType.number,
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add rating";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Product Price", 
                hideText: false, 
                controller: priceController, 
                fillcolor:colorLightGrey.withAlpha((0.05 * 255).toInt()),
                keyboardtype: TextInputType.number,
                validate: (val) {
                  if(val!.isEmpty){
                    return "Please add price";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
              MyTextFormField(
                hintText: "Select a file", 
                hideText: false, 
                controller: imageUrlController, 
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
                bottonName: "Add Product", 
                onTap: ()async{
                  if(_formKey.currentState != null){
                    if(_formKey.currentState!.validate()){
                      ref.read(_isLoading.notifier).state = true; // Use `read` for updates
                      Map<String, dynamic> data = {
                        "Name": nameController.text.trim().toString(),
                        "Color": colorController.text.trim().toString(),
                        "Seat": seatController.text.trim().toString(),
                        "Power": powerController.text.trim().toString(),
                        "maxSpeed": maxSpeedController.text.trim().toString(),
                        "Accleration": acclerationController.text.trim().toString(),
                        "Price" : priceController.text.trim().toString(),
                        "Rating": ratingController.text.trim().toString(),
                        "gearBox": gearboxController.text.trim().toString(),
                        "brand": brandController.text.trim().toString()
                      };

                      final result = await uploadToCloudinary(
                        _filePickerResult, 
                        null,
                        data
                      );
                      if(result){
                        nameController.clear();
                        imageUrlController.clear();
                        colorController.clear();
                        seatController.clear();
                        powerController.clear();
                        maxSpeedController.clear();
                        acclerationController.clear();
                        priceController.clear();
                        ratingController.clear();
                        gearboxController.clear();
                        brandController.clear();
                        SnackBarHelper.showSuccessSnackBar(context, uplaodProductSuccess);
                      }else{
                        SnackBarHelper.showErrorSnackBar(context, uploadProductError);
                      }
                      ref.read(_pickedFile.notifier).state = null; // Properly reset _pickedFile
                      ref.read(_isLoading.notifier).state = false; // Use `read` for updates
                    }
                  }
                  
                }
              ),
              const Gap(40),
            ],
          )
        ),
      ),
    );
  }
}