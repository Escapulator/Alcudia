import 'package:alcudia/Home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Offline3 extends StatelessWidget {
  final Connectivity _connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alcudia'),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(Icons.replay),
              onPressed: () async {
                var result = await _connectivity.checkConnectivity();
                result == ConnectivityResult.none
                    ? Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Offline3()),
                        (Route<dynamic> route) => false)
                    : Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()),
                        (Route<dynamic> route) => false);
              })
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
            child: Text(
              'You are currently offline',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView(
                children: [
                  Text(
                    'I HAVE A BOAT LICENSE; CAN I HIRE A TOP BOAT?',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      'If you are used to sailing and you have a license ratified in Spain (ask us if you have doubts), in Alcudia Bay Boat Rental we also have renting boats for you. For expert sailors, we rent the Graünner 650 Walkaround. It is a boat manufactured in Galicia, with a very sporty style and careful finishing touches. Technical innovation and safety, space and speed…A renting boat ready for enjoying the waters of Mallorca like you had never done before, with a driving place which will surprise you due to its comfort. After trying it, no one will be able to get you off the boat! A 6.5 meter-length boat ready to enjoy the sea in good company the time you wish. If you prefer a boat specially designed for the sea of Mallorca for 6 passengers our proposal is the motorboat v2 5.0, wide and secure with a 40 horse power engine that will allow you to navigate in the Mediterranean without even getting wet. Or if you are a large group the SACS 750 S25 DREAM with 250 horsepower will allow you to navigate up to 12 passengers, although the boat is designed for up to 18 people. In Alcudia Bay Boat Rental we are flexible regarding the rental timing options: you can rent a boat only for a few hours to discover the surroundings of Ca´n Picafort and Alcudia; for a day, being able to enjoy a picnic onboard and a swim in the sunset or even renting it for the days you need to discover every corner of the northern island with your family or friends. If you are planning to visit Alcudia Bay soon, do not hesitate to rent your boat right now and….sail! We will tell you the best places to navigate so that you can enjoy the island of Majorca like no one else.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
