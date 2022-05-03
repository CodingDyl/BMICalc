import 'package:flutter/material.dart';
import 'package:supermarket_app/constants/app_constats.dart';
import 'package:supermarket_app/widgets/left_bar.dart';
import 'package:supermarket_app/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  bmiResult = _w / (_h * _h);
                  if (bmiResult > 25) {
                    textResult = "You\'re over weight";
                  } else if (bmiResult >= 18.5 && bmiResult < 25) {
                    textResult = "You have a normal weight";
                  } else {
                    textResult = "You are under weight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                        color: accentHexColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              child: Text(bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor)),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Text(textResult,
                    style: TextStyle(
                        color: accentHexColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(height: 10.0),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 20.0),
            const LeftBar(
              barWidth: 70,
            ),
            const SizedBox(height: 20.0),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const RightBar(barWidth: 40),
            const SizedBox(
              height: 50.0,
            ),
            const RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
