import 'package:bmi/component/buttonCalc.dart';
import 'package:bmi/component/change_inc&dec.dart';
import 'package:bmi/component/slider.dart';
import 'package:bmi/screens/Home_page.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({required this.top, required this.Med, required this.bottom, Key? key}) : super(key: key);
  
  String top;
  String Med;
  String bottom;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int weight = 0;  // لتخزين وزن المستخدم
  int age = 0; 
  double height = 0.0;    // تأكد أن الـ height من نوع double

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            )),
        centerTitle: true,
        title:const Text("BMI Calculator",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Your Result",
            style: TextStyle(
              fontSize: 80,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              margin:const EdgeInsets.symmetric(vertical: 20),
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:const Color.fromARGB(255, 64, 76, 136),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.top,
                    style:const TextStyle(color: Colors.green, fontSize: 50),
                  ),
                  Text(
                    widget.Med,
                    style:const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                  Text(
                    widget.bottom,
                    style:const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          // هنا يتم تمرير المتغيرات المدخلة من قبل المستخدم (الوزن والعمر والطول)
          Calculate(
            state: "Re-Calculate",
            Age: Change(title: "Age", number: age),
            weight: Change(title: "Weight", number: weight),
            hight: height,  // تأكد من تمرير الطول كـ double
          )
        ],
      ),
    );
  }
}
