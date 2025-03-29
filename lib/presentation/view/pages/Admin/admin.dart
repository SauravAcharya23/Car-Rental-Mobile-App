import 'package:car_rental_app/presentation/view/pages/Admin/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin")),
      drawer: AppDrawer(),
      body: Center(child: Text("Welcome to Admin Page")),
    );
  }
}


