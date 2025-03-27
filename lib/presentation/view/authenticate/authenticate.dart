import 'package:car_rental_app/core/network/services/auth.dart';
import 'package:car_rental_app/presentation/view/authenticate/wrapper.dart';
import 'package:car_rental_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,// Stream of user data,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: AppRoutes.routes,
        // initialRoute: Routes.login,
        home: const Wrapper()
      ),
    );
  }
}