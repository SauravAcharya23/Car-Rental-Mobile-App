import 'package:car_rental_app/presentation/view/pages/Bottom_Navbar_page/bottom_navbar.dart';
import 'package:car_rental_app/routes/app_routes.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  // Device Preview Code
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(),
  //   )
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: AppRoutes.routes,
      initialRoute: Routes.bottomnavbar,
      home: const BottomNavBar()
    );
  }
}
