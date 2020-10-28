import 'package:flutter/material.dart';

class TermsAndConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Lorem Ipsum is simply dummy text",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),),
            SizedBox(height: 20,),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                " when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                " It has survived not only five centuries, but also the leap into electronic typesetting,"
                " remaining essentially unchanged.",
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w600,

                  color: Colors.black45),),
            SizedBox(height: 25,),
            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr,"
                " sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,"
                " sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. "
                "Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. "
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor "
                "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam "
                "et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est "
                "Lorem ipsum dolor",
              style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),)
          ],
        ),
      ),
    );
  }
}