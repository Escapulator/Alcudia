import 'package:alcudia/Home.dart';
import 'package:alcudia/offline1.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Offline extends StatelessWidget {
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
                            builder: (BuildContext context) => Offline()),
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
                    'RENT A TOP BOAT IN MALLOCAN ISLAND, NORTH OF MALLORCA.',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6, left: 6, right: 6),
                    child: Text(
                      'You will not know Mallorca properly until you have sailed across its waters. That was the main reason why Ritchie decided to set up Alcudia Bay Boat Rental in 2012, a boat rental company located in Ca´n Picafort, in the heart of the Alcudia Bay, in the north of the island of Majorca. After years enjoying the most hidden coves, away from everything and everyone, the most stunning blue colors are only accessible to those who sail across the waters of the north of Mallorca. The team of Alcudia Bay Boat Rental wants to share with you all these landscapes and experiences. We want you to know the most beautiful and unknown Majorca side and we will make it easy for you! In Alcudia Bay Boat Rental we have two types of rental boats, depending on you having or not the specific license required to sail a boat. For all those who have a boat license, we strongly recommend you to rent the Graünner 650 Walkarround vessel, a 6.5 metre-lenght boat which, with a 200 hp outboard motor together with the rest of conveniences, will delight the crew; or our v2 500, a extraordinary stable boat with 40 horse power. For large groups we recommend the Sacs 750 S25 Dream with 250 horse power, a boat with a construction capacity UP TO 18 PASSENGERS, where you can enjoy 12 friends according to current Spanish law. For those who do not have a license, you may hire the Quicksylver 455 Activ Open, a boat manufactured in 2017 which has everything necessary to spend an incredible day in the sea or our v2 500 built in 2019. A light 15 hp-boat with which you will sail all over the north of Mallorca safely with your family or friends. Do you fancy going for a swim? Rent your boat in Mallorca right now!',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Offline1(),
                        ));
                      },
                      child: Text('More'),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
