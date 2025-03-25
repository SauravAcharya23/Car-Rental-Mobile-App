import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorVeryLightGrey.withAlpha((0.15 * 255).toInt()),
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0, color: colorBlack),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: colorVeryLightGrey.withOpacity(.02),
        backgroundColor: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: GoogleFonts.poppins( fontSize: 20.0, color: colorBlack),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Car Booked Successfully",
                      style: GoogleFonts.poppins( fontSize: 16.0, color: colorBlack,),
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "1hr",
                    style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
                  ),
                ],
              ),
              subtitle: Text(
                "Car Booked Successfully",
                style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Rental Review Request",
                      style: GoogleFonts.poppins( fontSize: 16.0, color: colorBlack,),
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "2hr",
                    style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
                  ),
                ],
              ),
              subtitle: Text(
                "Rental Review Request",
                style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
              ),
            ),
            Text(
              "Yesterday",
              style: GoogleFonts.poppins( fontSize: 20.0, color: colorBlack),
            ),
            ListTile(
              tileColor: colorVeryLightGrey.withAlpha((.3 * 255).toInt()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Car Cancelled Successfully",
                      style: GoogleFonts.poppins( fontSize: 16.0, color: colorBlack,),
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "1d",
                    style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
                  ),
                ],
              ),
              subtitle: Text(
                "Car Cancelled Successfully",
                style: GoogleFonts.poppins( fontSize: 14.0, color: colorLightGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}