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

          // حساب الفئة العمرية والعوامل بناءً على الـ BMI
          if (widget.Age.number >= 2 && widget.Age.number <= 5) {
            // للأطفال من 2 إلى 5 سنوات
            if (bmi < 18.5 && height < 110) {
              top = "UNDERWEIGHT";
              Med = "$bmi";
              bottom = "very bad";
            } else if (bmi >= 18.5 && bmi <= 22.0 && height >= 85 && height <= 110) {
              top = "NORMAL";
              Med = "$bmi";
              bottom = "very good";
            } else if (bmi > 22.0) {
              top = "OVERWEIGHT";
              Med = "$bmi";
              bottom = "bad";
            }
            else{
              top = "UNDERWEIGT";
              Med = "$bmi";
              bottom = "Consanlt a doctor";
            }
          } else if (widget.Age.number >= 6 && widget.Age.number <= 12) {
            // للأطفال من 6 إلى 12 سنة
            if (bmi < 15.0 && height < 150) {
              top = "UNDERWEIGHT";
              Med = "$bmi";
              bottom = "very bad";
            } else if (bmi >= 15.0 && bmi <= 19.0 && height >= 110 && height <= 150) {
              top = "NORMAL";
              Med = "$bmi";
              bottom = "very good";
            } else if (bmi > 19.0) {
              top = "OVERWEIGHT";
              Med = "$bmi";
              bottom = "bad";
            } else{
              top = "UNDERWEIGT";
              Med = "$bmi";
              bottom = "Consanlt a doctor";
            }

          } else if (widget.Age.number >= 13 && widget.Age.number <= 19) {
            // للأطفال من 13 إلى 19 سنة
            if (bmi < 16.0 && height < 150) {
              top = "UNDERWEIGHT";
              Med = "$bmi";
              bottom = "very bad";
            } else if (bmi >= 16.0 && bmi <= 20.0 && height >= 150 && height <= 190) {
              top = "NORMAL";
              Med = "$bmi";
              bottom = "very good";
            } else if (bmi > 20.0) {
              top = "OVERWEIGHT";
              Med = "$bmi";
              bottom = "bad";
            }
             else{
              top = "UNDERWEIGT";
              Med = "$bmi";
              bottom = "Consanlt a doctor";
            }
          } else if (widget.Age.number >= 20) {
            // للبالغين من 20 سنة وما فوق
            if (bmi < 18.5 && height < 150) {
              top = "UNDERWEIGHT";
              Med = "$bmi";
              bottom = "very bad";
            } else if (bmi >= 18.5 && bmi <= 24.9 && height >= 150 && height <= 190) {
              top = "NORMAL";
              Med = "$bmi";
              bottom = "very good";
            } else if (bmi > 24.9) {
              top = "OVERWEIGHT";
              Med = "$bmi";
              bottom = "bad";
            }
             else{
              top = "UNDERWEIGT";
              Med = "$bmi";
              bottom = "Consanlt a doctor";
            }
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
