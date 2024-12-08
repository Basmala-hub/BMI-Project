import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Gender extends StatelessWidget {
  Gender({required this.gender, required this.type});
  IconData gender;
  String type;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: screenWidth * 0.3,
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 64, 76, 136),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Icon(
                gender,
                color: Colors.white,
                size: 100,
              ),
            ),
            Text(
              type,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }
}
