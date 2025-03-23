import 'package:car_rental_app/presentation/view/pages/Bottom_Navbar_page/bottom_navbar.dart';
import 'package:car_rental_app/presentation/view/pages/Filter_Page/filter.dart';
import 'package:car_rental_app/presentation/view/pages/Forgot_Password_Page/forgot_password.dart';
import 'package:car_rental_app/presentation/view/pages/Home_page/home_page.dart';
import 'package:car_rental_app/presentation/view/pages/Login_Page/login.dart';
import 'package:car_rental_app/presentation/view/pages/Signup_Page/signup.dart';
import 'package:car_rental_app/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.signup: (context) => const SignUpPage(),
    Routes.login: (context) => const LoginPage(),
    Routes.forgotPassword: (context) => const ForgotPasswordpage(),
    Routes.homepage: (context) => const HomePage(),
    Routes.bottomnavbar: (context) => const BottomNavBar(),
    Routes.filter: (context) => const FilterPage(),
  };
}