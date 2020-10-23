import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Wallet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
      ),
    );
  }
}
