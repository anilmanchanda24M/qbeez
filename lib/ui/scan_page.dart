import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Scan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
      ),
    );;
  }
}
