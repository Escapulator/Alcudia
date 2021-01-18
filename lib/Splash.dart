import 'dart:async';

import 'package:alcudia/Home.dart';
import 'package:alcudia/offline.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Connectivity _connectivity = Connectivity();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      var result = await _connectivity.checkConnectivity();
      result == ConnectivityResult.none
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Offline()),
              (Route<dynamic> route) => false)
          : Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset('assets/logo.png'),
    ));
  }
}
