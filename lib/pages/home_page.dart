import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sign_up_phone/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var maskPhone = new MaskTextInputFormatter(
    mask: '(##) # ####-####',
  );

  int _counter = 30;

  Timer? _timer;

  void _startTime() {
    _counter = 30;

    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          print(_counter);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 300,
                  child: Image.asset('assets/images/human.png'),
                ),
              ),
              Text(
                'Let’s get started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Make the school app \nyour personal assistant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kTextColorWith,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 55,
                    decoration: BoxDecoration(
                      color: kTertiaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+55',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    width: 240,
                    height: 55,
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: TextField(
                        inputFormatters: [maskPhone],
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your phone',
                          contentPadding: EdgeInsets.all(0),
                          hintStyle: TextStyle(
                            color: kTextColorWith.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _onButtonPressed();
                      _startTime();
                    });
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 33,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1, // Underline thickness
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Don´t have on acconount? Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: Colors.transparent,
              height: 350,
              child: _buildBottomValidate(),
            );
          });
        });
  }

  Column _buildBottomValidate() {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          child: Icon(
            Icons.keyboard_arrow_down,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
        Text('Wait $_counter s'),
        SizedBox(
          height: 15,
        ),
        Text(
          'Enter your code phone',
          style: TextStyle(fontSize: 18, color: kTextColorBlack),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InputCode(),
              InputCode(),
              InputCode(),
              InputCode(),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 55,
          width: 340,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class InputCode extends StatelessWidget {
  const InputCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 5, color: kSecondaryColor),
          left: BorderSide(width: 5, color: kSecondaryColor),
          right: BorderSide(width: 5, color: kSecondaryColor),
          bottom: BorderSide(width: 5, color: kSecondaryColor),
        ),
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: 55,
      height: 60,
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            hintStyle: TextStyle(
              color: kTextColorWith.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}
