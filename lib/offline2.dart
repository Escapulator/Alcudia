import 'package:alcudia/Home.dart';
import 'package:alcudia/offline3.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Offline2 extends StatelessWidget {
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
                    'HOW LONG CAN I RENT A BOAT?',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6, left: 6, right: 6),
                    child: Text(
                      'In Alcudia bay Boat Rental we are flexible in terms of duration of the rentals: You can rent a boat from 4 hours to a week, even longer if your stay in Mallorca is more prolonged. See our rates in low season and high season. Whether you have visited before the island or is the first time that you visit Mallorca, the shades of blue in the sea aren’t going to leave you indifferent. Surely you have heard a million times of hidden coves in the North of the island, the ones no one shows you how to get, isn’t it true? Well, ¡Is time you discover it by yourself! Hire one of our boats without license and discover all these secret coves in the North of Mallorca, as well as the crystal clear waters of the Alcudia bay in a way you have never imagined. If you are going to stay or you stay in the North of Mallorca, you can lease a boat without license in our office in Ca’n Picafort, located in the middle of the Alcudia bay, or in our office of Son Serra de Marina. Also you can contact us by telephone or filling the contact form available in our website. We will be pleased to help you!',
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
                          builder: (context) => Offline3(),
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
