import 'package:car_rental_app/core/ui/colors.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanCardPage extends StatefulWidget {
  const ScanCardPage({super.key});

  @override
  State<ScanCardPage> createState() => _ScanCardPageState();
}

class _ScanCardPageState extends State<ScanCardPage> {

  CardDetails? cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
    scanCardHolderName: true,
    enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 1,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

   Future<void> scanCard() async {
    var cardDetail = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;

    // if (cardDetail != null) {
    //   print("Card scanned successfully: ${cardDetail.cardNumber}");
    // } else {
    //   print("Card scan failed or no card detected.");
    // }
    setState(() {
      cardDetails = cardDetail;
    });

    // If card is scanned successfully, return to the previous page with card details
    if (cardDetails != null) {
      Navigator.pop(context, cardDetails); // Pass the cardDetails back to the previous page
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan Card",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0, color: colorBlack),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: colorVeryLightGrey.withOpacity(.02),
        backgroundColor: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
        leading:  IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_rounded, size: 35, color: Colors.black,), // Custom back button icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           ElevatedButton(
                onPressed: () async {
                  scanCard();
                },
                child: Text('scan card'),
              ),
              Text('${cardDetails?.cardNumber}'),
              // SizedBox(
              //   height: 400,
              //   child: OptionConfigureWidget(
              //     initialOptions: scanOptions,
              //     onScanOptionChanged: (newOptions) => scanOptions = newOptions,
              //   ),
              // )
          ],
        ),
      ),
    );
  }
}