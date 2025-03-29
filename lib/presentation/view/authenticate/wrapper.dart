import 'package:car_rental_app/core/network/services/auth.dart';
import 'package:car_rental_app/model/user/user_model.dart';
import 'package:car_rental_app/presentation/view/pages/Admin/admin.dart';
import 'package:car_rental_app/presentation/view/pages/Bottom_Navbar_page/bottom_navbar.dart';
import 'package:car_rental_app/presentation/view/pages/Login_Page/login.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: AuthService().user, 
      builder: (context, snapshot) {

        print("object:  ${snapshot.data?.uid}");
        
        if(snapshot.data == null){
          return LoginPage();
        }else{
          if(snapshot.data?.uid == 'tXQCVdsnhXRKnvyaWiGDSKhVV0t1'){
            return AdminPage();
          }else{
            return BottomNavBar();
          }
        }
      },
    );
  }
}