import 'package:bmi/component/buttonCalc.dart';
import 'package:bmi/component/change_inc&dec.dart';
import 'package:bmi/component/gender_item.dart';
import 'package:bmi/component/slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // تهيئة قيم العمر والوزن والطول
  Change weightWidget = Change(title: "Weight", number: 0);  // تحديد وزن ابتدائي
  Change ageWidget = Change(title: "Age", number: 0);  // تحديد عمر ابتدائي
  double height = 150; // القيمة الافتراضية للطول
  
  // دالة لتحديث الطول
  void updateHeight(double newHeight) {
    setState(() {
      height = newHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0E21),
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Gender(gender: Icons.male, type: "Male"),
              Gender(gender: Icons.female, type: "Female")
            ],
          ),
          Slider_Component(
            onHeightChanged: updateHeight, // تمرير الـ callback لتحديث الطول
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weightWidget,  // مررنا الـ widget الخاص بالوزن
              ageWidget,     // مررنا الـ widget الخاص بالعمر
            ],
          ),
          Calculate(
            Age: ageWidget,    // تمرير الـ widget الخاص بالعمر
            weight: weightWidget, // تمرير الـ widget الخاص بالوزن
            state: "Calculate",  // النص الذي يظهر على الزر
            hight: height,  // تمرير قيمة الطول المُحدثة
          ),
        ],
      ),
    );
  }
}
