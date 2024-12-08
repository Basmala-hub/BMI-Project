import 'package:flutter/material.dart';

class Slider_Component extends StatefulWidget {
  final Function(double) onHeightChanged; // Callback لتمرير القيمة

  const Slider_Component({super.key, required this.onHeightChanged}); // تمرير الـ Callback عبر المُنشئ

  @override
  State<Slider_Component> createState() => _Slider_ComponentState();
}

class _Slider_ComponentState extends State<Slider_Component> {
  double _height = 150;  // متغير لحفظ الطول

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: screenWidth * 0.75,
      height: height * 0.2, // زيادة الارتفاع قليلاً لضمان المساحة الكافية
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 64, 76, 136),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // جعل المحاذاة المركزية للعناصر
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 163, 141, 141)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // إضافة padding لتحسين المسافة
            child: Text(
              "${_height.toStringAsFixed(0)} cm",
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Slider(
            value: _height,
            min: 100,  // الحد الأدنى للطول
            max: 250,  // الحد الأقصى للطول
            divisions: 150,  // تقسيمات الشريط
            activeColor: const Color.fromARGB(255, 158, 29, 89),
            onChanged: (double newHeight) {
              setState(() {
                _height = newHeight;
              });
              widget.onHeightChanged(_height); // تمرير القيمة المعدلة إلى الـ Parent Widget
            },
          ),
        ],
      ),
    );
  }
}
