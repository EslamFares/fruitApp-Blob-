import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'data.dart';

class ShowFruit extends StatefulWidget {
  @override
  _ShowFruitState createState() => _ShowFruitState();
}

class _ShowFruitState extends State<ShowFruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: data[2]['color'],
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: 20,
          height: 20,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5 - 50,
              color: data[2]['color'],
              child: Center(
                child: Carousel(
                  images: [
                    NetworkImage('${data[1]['img']}'),
                    NetworkImage('${data[2]['img']}'),
                    NetworkImage('${data[3]['img']}'),
                    NetworkImage('${data[0]['img']}'),
                  ],
                  dotColor: Colors.red[200],
                  dotIncreaseSize: 1.4,
                  dotIncreasedColor: Colors.red,
                  dotBgColor: Colors.transparent,
                  autoplay: false,
                  boxFit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 + 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        '${data[1]['name']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                Text(
                                  '2kg',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '\$8.01',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mi turpis, placerat vel cursus id, posuere in nunc. Quisque sed nulla erat. ',
                      style: TextStyle(
                          height: 1.5, fontSize: 16, color: Colors.grey[600]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              width: 45,
                              height: 45,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red[800],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CartPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              width: 250,
                              height: 55,
                              child: Center(
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
