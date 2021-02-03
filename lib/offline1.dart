import 'package:alcudia/Home.dart';
import 'package:alcudia/offline2.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Offline1 extends StatelessWidget {
  final Connectivity _connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent A Boat in Mallorca'),
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
                            builder: (BuildContext context) => Offline2()),
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
                    'I DON’T HAVE A LICENSE; CAN I RENT A BOAT IN MALLORCA?',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6, left: 6, right: 6),
                    child: Text(
                      'If you thought that renting a boat in Mallorca was something complicated, you may not have heard about us. License, captain, high prices… forget it! In Alcudia Bay Boat Rental we want to make it easy for all those who do not have a license but want to navigate for a while. If you are a sea lover and you want to enjoy it to the maximum living a new experience, renting a no-license boat is what you were looking for. In Alcudia Bay Boat Rental we trust in the Quicksylver 455 Activ Open and our v2 500 with 15 horse power. Quick, light, comfortable and very safe boats. Hiring one of these boats guarantees fun for hours in the crystal waters of Mallorca, for you and for four more people in the Quicksylver case, and for you and five passangers more in the v2 500 case. These no-license boats has the perfect deck to spend hours sunbathing, fishing or having a good time with your family and friends. It also has three lockers which will help you to keep the boat tidy.',
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
                          builder: (context) => Offline2(),
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
