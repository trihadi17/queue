import 'dart:async';

import 'package:flutter/material.dart';

// Page
import 'package:queue/pages/add_page.dart';

// Theme
import 'package:queue/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/add',
        (route) => false,
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon.png',
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Que",
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: bold,
                ),
              ),
              Text(
                "ue",
                style: blackTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
