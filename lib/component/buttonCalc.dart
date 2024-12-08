import 'package:bmi/component/change_inc&dec.dart';
import 'package:bmi/component/slider.dart';
import 'package:bmi/screens/page2.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  Calculate({required this.Age, required this.weight, required this.state, required this.hight});
  
  Change weight;
  Change Age;
  double hight;
  String state;

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String? top;
  String? Med;
  String? bottom;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: Color.fromARGB(255, 158, 29, 89),
      onPressed: () {
        setState(() {
          // التأكد من تحويل الوزن والطول إلى Double إذا لزم الأمر
          double weight = widget.weight.number?.toDouble() ?? 0.0;
          double height = widget.hight;

          // حساب الـ BMI
          double bmi = double.parse((weight / ((height / 100) * (height / 100))).toStringAsFixed(1));

          if (bmi < 18.5) {
            top = "UNDERWEIGHT";
            Med = "$bmi";
            bottom = "very bad";
          } else if (bmi >= 18.5 && bmi <= 24.9) {
            top = "NORMAL";
            Med = "$bmi";
            bottom = "very good";
          } else if (bmi >= 25 && bmi <= 29.9) {
            top = "OVERWEIGHT";
            Med = "$bmi";
            bottom = "bad";
          } else if (bmi >= 30 && bmi <= 34.9) {
            top = "OBESE";
            Med = "$bmi";
            bottom = "bad";
          } else if(bmi > 35) {
            top = "EXTREMELY OBESE";
            Med = "$bmi";
            bottom = "bad";
          }
        });

        // تأكد من أن المتغيرات ليست null
        if (top != null && Med != null && bottom != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Page2(
              top: top!,
              Med: Med!,
              bottom: bottom!,
            );
          }));
        }
      },
      child: Text(widget.state),
    );
  }
}
