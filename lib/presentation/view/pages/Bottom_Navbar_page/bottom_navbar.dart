import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/pages/Bookmark_Page/bookmark.dart';
import 'package:car_rental_app/presentation/view/pages/Home_page/home_page.dart';
import 'package:car_rental_app/presentation/view/pages/Notification_Page/notification.dart';
import 'package:car_rental_app/presentation/view/pages/Person_Details_Page/person.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const BookmarkPage(),
    const NotificationPage(),
    const PersonDetailsPage()
  ];

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorLightPurple,
        items: [
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? colorLightPurple : colorLightGrey, 
                BlendMode.srcIn, // Applies color tint
              ),
              child: Image.asset('lib/images/home.png'),
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? colorLightPurple : colorLightGrey, 
                BlendMode.srcIn, // Applies color tint
              ),
              child:  Image.asset('lib/images/bookmark.png'),
            ),
            label: "Bookmark"
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? colorLightPurple : colorLightGrey, 
                BlendMode.srcIn, // Applies color tint
              ),
              child: Image.asset('lib/images/notification.png'),
            ),
            label: "Notification"
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? colorLightPurple : colorLightGrey, 
                BlendMode.srcIn, // Applies color tint
              ),
              child: Image.asset('lib/images/person.png'),
            ),
            label: "Person"
          )
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}