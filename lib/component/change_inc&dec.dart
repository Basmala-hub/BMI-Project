import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  Change({required this.number, required this.title, Key? key}) : super(key: key);

  String title;
  int number;

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  @override
  Widget build(BuildContext context) {
    // تحديد أبعاد الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.3,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 64, 76, 136),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,  // استخدم widget.title بدلاً من title
            style: const TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 163, 141, 141)),
          ),
          Text("${widget.number}"), // استخدم widget.number لعرض القيمة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 163, 141, 141),
                  onPressed: () {
                    setState(() {
                      widget.number++; // زيادة الرقم
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 163, 141, 141),
                  onPressed: () {
                    setState(() {if(widget.number>0)
                     { widget.number--; }// تقليل الرقم
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
