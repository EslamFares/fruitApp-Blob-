import 'package:blobs/blobs.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.pink[100],
              ),
            ),
            Positioned(
              bottom: 10,
              right: MediaQuery.of(context).size.width / 2 - 110,
              left: MediaQuery.of(context).size.width / 2 - 110,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Center(
                    child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular((25.0)))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 70,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          elevation: 8,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.red,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Your Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Spacer(),
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '\$19.02',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    // color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 1.60,
                          // color: Colors.amber,
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    customShape(
                                        context: context,
                                        bgcolor: data[index]['color'],
                                        icon: Icon(
                                          data[index]['icon'],
                                          color: data[index]['Iconcolor'],
                                        ),
                                        imgUrl: data[index]['img']),
                                    SizedBox(width: 1),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${data[index]['name']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18.0),
                                        ),
                                        Text(
                                          '\$3.1kg',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Material(
                                          elevation: 5,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child: Center(
                                                child: Icon(Icons.remove)),
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '2',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(width: 10),
                                        Material(
                                          elevation: 5,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            child:
                                                Center(child: Icon(Icons.add)),
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.delete,
                                          color: Colors.grey[700],
                                        )
                                      ],
                                    )
                                  ],
                                );
                              }),
                        ),
                        SizedBox(height: 10),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 40,
                              width: 320,
                              // color: Colors.amber,
                              child: Center(
                                  child: Text(
                                'APPLY COUPON',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container customShape(
      {@required BuildContext context,
      @required Color bgcolor,
      @required String imgUrl,
      @required Icon icon}) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 150,
              width: 150,
              // color: Colors.blue,
              child: Transform.translate(
                offset: Offset(-15, -18),
                child: Transform.scale(
                  scale: 1.8,
                  child: ClipPath(
                    clipper:
                        BlobClipper(edgesCount: 4, minGrowth: 5, id: '4-4-62'),
                    child: Image.network(
                      "https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/cooldownpink.jpg?itok=-SDuFsdT",
                      color: bgcolor != null ? bgcolor : Colors.greenAccent,
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  // color: Colors.purpleAccent,
                  image: DecorationImage(
                      image: NetworkImage(imgUrl != null
                          ? imgUrl
                          : 'https://www.jingold.it/wp-content/uploads/2020/02/verde-ok-1.png'),
                      fit: BoxFit.contain),
                )),
          )
        ],
      ),
    );
  }
}
