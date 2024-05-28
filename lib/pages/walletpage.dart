import 'dart:convert';
import 'package:delivery_app/widgets/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
 bool fiveHundred = false, oneThousand = false, fifteenHundred = false, twoThousand = false;
 int selectedAmount = 0;
  int walletAmount = 0;

  void updateSelectedAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      fiveHundred = amount == 500;
      oneThousand = amount == 1000;
      fifteenHundred = amount == 1500;
      twoThousand = amount == 2000;
    });
  }

  void addMoneyToWallet() {
    setState(() {
      walletAmount += selectedAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wallet",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/wallet.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Wallet",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "\$ $walletAmount",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Add Money",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:fiveHundred? Colors.black: Colors.white),
                  onPressed: (){
                    setState(() {
                      fiveHundred = true;
                      oneThousand = false;
                      fifteenHundred = false;
                      twoThousand = false;
                      updateSelectedAmount(500);
                    });
                  },
                  child: Text(
                    "\$ 500",
                    style: TextStyle(fontWeight: FontWeight.bold,color: fiveHundred? Colors.white: Colors.black),
                  ),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:oneThousand? Colors.black: Colors.white),
                  onPressed: (){
                     setState(() {
                      fiveHundred = false;
                      oneThousand = true;
                      fifteenHundred = false;
                      twoThousand = false;
                    });
                  },
                  child: Text(
                    "\$ 1000",
                    style: TextStyle(fontWeight: FontWeight.bold,color: oneThousand? Colors.white: Colors.black),
                  ),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:fifteenHundred? Colors.black: Colors.white),
                  onPressed: (){
                     setState(() {
                      fiveHundred = false;
                      oneThousand = false;
                      fifteenHundred = true;
                      twoThousand = false;
                    });
                  },
                  child: Text(
                    "\$ 1500",
                    style: TextStyle(fontWeight: FontWeight.bold,color: fifteenHundred? Colors.white:Colors.black),
                  ),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:twoThousand? Colors.black: Colors.white),
                  onPressed: (){ setState(() {
                      fiveHundred = false;
                      oneThousand = false;
                      fifteenHundred = false;
                      twoThousand = true;
                      updateSelectedAmount(2000);
                    });},
                  child: Text(
                    "\$ 2000",
                    style: TextStyle(fontWeight: FontWeight.bold, color: twoThousand? Colors.white: Colors.black),
                  ),
                ),
                // Other containers...
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                addMoneyToWallet();
              },
              child: Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
